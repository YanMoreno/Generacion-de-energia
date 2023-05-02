
## EJEMPLO2
# Crear un dataframe con las características de los televisores
tv_data <- data.frame(
  marca = c("Samsung", "LG", "Sony", "TCL", "Panasonic", "Hisense", "Vizio", "Toshiba", "Sharp", "Philips"),
  modelo = c("Q90T", "CX", "X950H", "4-Series", "GX850", "H9G", "M-Series", "Fire TV", "LC", "5800"),
  tamano_pantalla = c(55, 65, 75, 43, 65, 55, 65, 50, 60, 55),
  precio = c(2000, 2500, 3000, 500, 1500, 1000, 1200, 700, 800, 900)
)
# Calcular la matriz de covarianza de las variables
cov_matrix <- cov(tv_data[, c("tamano_pantalla", "precio")])
# Calcular la distancia mahalanobis para cada televisor
mahalanobis_dist <- mahalanobis(tv_data[, c("tamano_pantalla", "precio")], center = colMeans(tv_data[, c("tamano_pantalla", "precio")]), cov = cov_matrix)
# Agregar la distancia mahalanobis al dataframe original
tv_data$mahalanobis_dist <- mahalanobis_dist
# Encontrar los televisores con la distancia mahalanobis más grande
outliers <- tv_data[order(-tv_data$mahalanobis_dist), ]
(outliers)

