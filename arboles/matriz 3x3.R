# 1. Instalar y cargar las librerías necesarias
if(!require(readxl)) install.packages("readxl")
if(!require(e1071)) install.packages("e1071")

library(readxl)
library(e1071)

# 2. Definir la ruta del archivo provista
ruta_excel <- "naive-bayes.iris.data.xlsx"

# 3. Leer los datos originales exclusivamente del rango [A1:F150]
# Nota: Si tu hoja tiene un nombre específico, cámbialo en 'sheet'. Por defecto lee la primera.
datos_iris <- read_excel(ruta_excel, range = "A1:F150", col_names = TRUE)

# Limpiar nombres de columnas eliminando espacios si los hubiera
colnames(datos_iris) <- trimws(colnames(datos_iris))

# Limpiar el prefijo 'Iris-' de la columna de clase y quitar espacios
datos_iris$clase <- gsub("Iris-", "", trimws(datos_iris$clase))

# Definir el orden estricto de la matriz solicitada
orden_clases <- c("setosa", "virginica", "versicolor")
datos_iris$clase <- factor(datos_iris$clase, levels = orden_clases)

# 4. Seleccionar aleatoriamente 20 observaciones para la evaluación
set.seed(42) # Semilla para asegurar que los resultados sean reproducibles
indices_muestra <- sample(1:nrow(datos_iris), 20)
muestra_evaluacion <- datos_iris[indices_muestra, ]

# 5. Entrenar el modelo con los datos del archivo
# Esto emula perfectamente la lógica probabilística de las celdas [T151:AC413]
modelo_nb <- naiveBayes(clase ~ sepall + sepalw + petall + petalw, data = datos_iris)

# 6. Probar el clasificador NB en las 20 observaciones seleccionadas
predicciones <- predict(modelo_nb, muestra_evaluacion)

# 7. Construir la Matriz de Confusión 3x3 solicitada
# Filas: Resultados del clasificador (Predicción)
# Columnas: Valores reales
matriz_confusion <- table(Prediccion = predicciones, Real = muestra_evaluacion$clase)

# Forzar a que la matriz mantenga estrictamente el orden solicitado
matriz_confusion <- matriz_confusion[orden_clases, orden_clases]

# 8. Mostrar los resultados en la consola de R
cat("====================================================\n")
cat("     RESULTADOS DE LAS 20 OBSERVACIONES EVALUADAS   \n")
cat("====================================================\n")
print(data.frame(Real = muestra_evaluacion$clase, Prediccion = predicciones))

cat("\n====================================================\n")
cat("            MATRIZ DE CONFUSIÓN (3x3)               \n")
cat("====================================================\n")
print(matriz_confusion)