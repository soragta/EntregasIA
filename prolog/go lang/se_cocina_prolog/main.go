package main

import (
	"context"
	"fmt"
	"log"

	"github.com/ichiban/prolog"
)

// 1. Base de Conocimientos en Prolog (Hechos y Reglas lógicas)
const baseConocimiento = `
% Hechos: recetas (Platillo, Ingrediente, Cantidad Requerida)
receta(arroz_con_pollo, arroz, 200).
receta(arroz_con_pollo, pollo, 1).
receta(arroz_con_pollo, cebolla, 1).

receta(estofado, pollo, 1).
receta(estofado, papa, 3).
receta(estofado, tomate, 4).
receta(estofado, cebolla, 2).

% Hechos: inventario actual (Ingrediente, Cantidad Disponible)
inventario(pollo, 2).
inventario(tomate, 5).
inventario(cebolla, 1).
inventario(arroz, 500).

% Regla de Inferencia 1: El ingrediente falta porque NO existe en el inventario
falta(Plato, Ingrediente, CantidadFaltante) :-
    receta(Plato, Ingrediente, Requerido),
    \+ inventario(Ingrediente, _),
    CantidadFaltante is Requerido.

% Regla de Inferencia 2: Existe en el inventario, pero la cantidad no alcanza
falta(Plato, Ingrediente, CantidadFaltante) :-
    receta(Plato, Ingrediente, Requerido),
    inventario(Ingrediente, Disponible),
    Disponible < Requerido,
    CantidadFaltante is Requerido - Disponible.
`

// 2. Función en Go para consultar al motor lógico de Prolog
func consultarGuiso(p *prolog.Interpreter, plato string) {
	fmt.Printf("\n==== CONSULTANDO INGREDIENTES PARA: %s ====\n", plato)

	// Construimos la consulta dinámica para Prolog
	queryStr := fmt.Sprintf("falta(%s, Ingrediente, Cuanto).", plato)

	ctx := context.Background()
	sols, err := p.QueryContext(ctx, queryStr)
	if err != nil {
		log.Fatalf("Error al ejecutar la consulta: %v", err)
	}
	defer sols.Close()

	faltantes := false

	// El motor de Prolog busca y nos devuelve todas las soluciones que cumplan la regla
	for sols.Next() {
		faltantes = true

		// Estructura temporal para mapear las variables lógicas de Prolog a tipos de Go
		var solucion struct {
			Ingrediente string `prolog:"Ingrediente"`
			Cuanto      int    `prolog:"Cuanto"`
		}

		if err := sols.Scan(&solucion); err != nil {
			log.Fatalf("Error al procesar la solución: %v", err)
		}

		fmt.Printf("Alerta Cocinero: Falta(n) %d unidades de '%s'\n", solucion.Cuanto, solucion.Ingrediente)
	}

	// Si el ciclo for no encontró "soluciones" a la falta de ingredientes, significa que todo está listo
	if !faltantes {
		fmt.Println("¡Excelente! Tienes todos los ingredientes listos en el inventario.")
	}
}

func main() {
	// Inicializar el intérprete de Prolog
	p := prolog.New(nil, nil)

	// Cargar las reglas lógicas en el motor
	if err := p.Exec(baseConocimiento); err != nil {
		log.Fatalf("Error al cargar las reglas de Prolog: %v", err)
	}

	// Probar diferentes casos con el menú
	consultarGuiso(p, "arroz_con_pollo")
	consultarGuiso(p, "estofado")
}
