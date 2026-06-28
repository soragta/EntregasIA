## Ingeniería del Conocimiento

Este documento aborda la Ingeniería del Conocimiento (IC) como una rama de la Inteligencia Artificial encargada de la adquisición, representación y procesamiento del conocimiento para construir Sistemas Expertos (SE). 

Conceptos Fundamentales: Define el conocimiento como una combinación de estructuras de datos y procedimientos que modelan el mundo real. Se distinguen tres tipos: declarativo (hechos), procedural (reglas de solución) y metaconocimiento (conocimiento sobre el propio razonamiento)

Actores Principales: El proceso involucra al Ingeniero de Conocimiento (ICO), un especialista que extrae el saber del experto humano para plasmarlo en una Base de Conocimiento, considerando también las necesidades del usuario final.

## Procesos de la IC

1. Adquisición del Conocimiento (AC): Es la extracción de información de fuentes estáticas (libros) o dinámicas (expertos). Consta de cinco etapas: identificación, entendimiento, formalización, implementación y pruebas.

2. Representación del Conocimiento (KR): Consiste en organizar el conocimiento de forma inteligible mediante esquemas como reglas de lógica simbólica, redes semánticas, árboles de decisión, frames (marcos) o diagramas lógicos.

3. Otros procesos: Incluyen la validación (asegurar que el sistema actúe como un experto), la inferencia (diseño del software de razonamiento) y la capacidad de explicación y justificación.

##

Métodos de Adquisición: Pueden ser manuales (entrevistas, protocolos), semiautomatizados (herramientas de apoyo al experto o al ingeniero) y automatizados (inducción de reglas y aprendizaje automático).

## Sistemas Expertos Basados en Reglas

Este texto se centra en los sistemas basados en reglas como herramientas eficientes para resolver problemas complejos que se rigen por reglas deterministas. 

## Estructura del Sistema

Se compone de tres elementos clave: 

1. Base de Conocimiento: Contiene las reglas (relaciones permanentes y estáticas).

2. Memoria de Trabajo: Almacena los hechos (información dinámica y específica de la situación actual).

3. Motor de Inferencia: Aplica la lógica a los hechos y reglas para obtener conclusiones.

4. Las Reglas: Tienen una premisa o antecedente (si...) y una conclusión o consecuente (entonces...). Pueden ser simples o compuestas.

## Mecanismos de Inferencia

1. Modus Ponens: Inferencia hacia adelante; si la premisa es cierta, se acepta la conclusión.

2. Modus Tollens: Inferencia hacia atrás; si la conclusión es falsa, la premisa también lo es.

3. Resolución: Permite obtener conclusiones compuestas combinando y simplificando expresiones lógicas de múltiples reglas.

##

Estrategias de Control: El documento detalla el encadenamiento hacia adelante (partir de hechos conocidos para llegar a conclusiones) y el encadenamiento hacia atrás o orientado a objetivos (partir de una meta y buscar los hechos que la sustenten).

Control de Coherencia y Explicación: Es crucial evitar incoherencias tanto en las reglas como en los hechos aportados por el usuario para no llegar a resultados absurdos. Además, el sistema debe ser capaz de explicar sus conclusiones mostrando la lista de reglas ejecutadas.

Incertidumbre: Finalmente, se menciona que aunque estos sistemas son deterministas, se pueden extender para tratar la incertidumbre mediante lógicas probabilísticas.

