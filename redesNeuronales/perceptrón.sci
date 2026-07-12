// Limpiar consola y variables
clc;
clear;

// 1. Datos de entrada originales (XOR)
X_2d = [0 0; 
        0 1; 
        1 0; 
        1 1];
        
// Salidas deseadas (Y)
Y = [0; 1; 1; 0];

// 2. Ingeniería de Características (Mapeo a 3D: x1, x2, x1*x2)
X_3d = [X_2d(:,1), X_2d(:,2), X_2d(:,1) .* X_2d(:,2)];

// 3. Inicialización del Perceptrón con los pesos teóricos
W = [1; 1; -2]; 
b = -0.5;

// ---- Graficación en 3D ----
clf(); // Limpiar figura anterior
f = gcf();

// Graficar puntos de salida 0 (Azul) y salida 1 (Rojo)
for i = 1:4
    if Y(i) == 0 then
        scatter3d(X_3d(i,1), X_3d(i,2), X_3d(i,3), 80, "blue", "fill");
    else
        scatter3d(X_3d(i,1), X_3d(i,2), X_3d(i,3), 80, "red", "fill");
    end
end

// Crear una malla para graficar el plano separador: x1 + x2 - 2x3 - 0.5 = 0
// Despejando z (x3): z = (x1 + x2 - 0.5) / 2
[x1_mesh, x2_mesh] = meshgrid(-0.2:0.1:1.2, -0.2:0.1:1.2);
z_mesh = (x1_mesh + x2_mesh - b) / (-W(3)); 

// Dibujar el plano
surf(x1_mesh, x2_mesh, z_mesh);
h = gce(); 
h.color_mode = 4; // Color plano para el hiperplano
h.foreground = 2;

// Configuraciones de la gráfica
xtitle("Separación de la compuerta XOR en espacio 3D usando un Kernel", "X1", "X2", "X3 (X1*X2)");
legend(["Clase 0"; "Clase 1"; "Plano Separador"]);
gca().rotation_angles = [65, 45]; // Ajustar ángulo de vista para apreciar la separación
