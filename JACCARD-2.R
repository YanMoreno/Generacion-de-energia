## EJEMPLO

# Creamos un dataframe con algunos datos de compras de clientes
datos <- data.frame(
  Cliente = c("A", "A", "B", "B", "B", "C", "C", "D", "D", "D"),
  Producto = c("Leche", "Pan", "Leche", "Huevos", "Pan", "Huevos", "Queso", "Pan", "Queso", "Huevos")
)

# Creamos dos subconjuntos de datos, uno para A y otro para B
datos_A <- subset(datos, Cliente == "A")
datos_B <- subset(datos, Cliente == "B")

# Creamos un subconjunto de datos para C y otro para D
datos_C <- subset(datos, Cliente == "C")
datos_D <- subset(datos, Cliente == "D")

# Calculamos la distancia de Jaccard entre los subconjuntos
d_AB <- 1 - length(intersect(datos_A$Producto, datos_B$Producto)) / length(union(datos_A$Producto, datos_B$Producto))
d_AC <- 1 - length(intersect(datos_A$Producto, datos_C$Producto)) / length(union(datos_A$Producto, datos_C$Producto))
d_AD <- 1 - length(intersect(datos_A$Producto, datos_D$Producto)) / length(union(datos_A$Producto, datos_D$Producto))
d_BC <- 1 - length(intersect(datos_B$Producto, datos_C$Producto)) / length(union(datos_B$Producto, datos_C$Producto))
d_BD <- 1 - length(intersect(datos_B$Producto, datos_D$Producto)) / length(union(datos_B$Producto, datos_D$Producto))
d_CD <- 1 - length(intersect(datos_C$Producto, datos_D$Producto)) / length(union(datos_C$Producto, datos_D$Producto))

# Imprimimos los resultados
print(paste("Distancia de Jaccard entre A y B:", d_AB))
print(paste("Distancia de Jaccard entre A y C:", d_AC))
print(paste("Distancia de Jaccard entre A y D:", d_AD))
print(paste("Distancia de Jaccard entre B y C:", d_BC))
print(paste("Distancia de Jaccard entre B y D:", d_BD))
print(paste("Distancia de Jaccard entre C y D:", d_CD))


### EJEMPLO2

# Creamos un dataframe con algunos datos de compras de clientes
datos <- data.frame(
  Cliente = c("A", "A", "B", "B", "B", "C", "C", "D", "D", "D"),
  Producto = c("Leche", "Pan", "Leche", "Huevos", "Pan", "Huevos", "Queso", "Pan", "Queso", "Huevos")
)

# Creamos una lista de clientes únicos
clientes <- unique(datos$Cliente)

# Creamos una matriz para almacenar las distancias de Jaccard
matriz_distancias <- matrix(0, nrow=length(clientes), ncol=length(clientes))

# Calculamos las distancias de Jaccard entre cada par de clientes
for(i in 1:length(clientes)){
  for(j in 1:length(clientes)){
    datos_i <- subset(datos, Cliente == clientes[i])
    datos_j <- subset(datos, Cliente == clientes[j])
    d_ij <- 1 - length(intersect(datos_i$Producto, datos_j$Producto)) / length(union(datos_i$Producto, datos_j$Producto))
    matriz_distancias[i,j] <- d_ij
  }
}

# Asignamos los nombres de los clientes a las filas y columnas de la matriz
rownames(matriz_distancias) <- clientes
colnames(matriz_distancias) <- clientes

# Imprimimos la matriz de distancias
print(matriz_distancias)

