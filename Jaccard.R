
## EJEMPLO DISTANCIA JACCARD
conjunto1 <- c("Camilo", "Sofia", "Alejandro", "Alexandra") 
conjunto2 <- c("Sofia", "Alejandro", "Cata", "Ivan") 

jaccard <- length(intersect(conjunto1, conjunto2)) / length(union(conjunto1, conjunto2))
jaccard_distance <- 1 - jaccard

jaccard_distance 


## EJEMPLO JACCARD 

compras_cliente1 <- c("Camisa", "Pantalon", "Corbata", "Zapatos", "Medias")
compras_cliente2 <- c("Pantalon", "Zapatos", "Jean", "Sombrero", "Chaqueta")

jaccard_distance <- 1 - length(intersect(compras_cliente1, compras_cliente2)) / length(union(compras_cliente1, compras_cliente2))
jaccard_distance

###EJEMPLO2

# Crear un dataframe con las compras de los clientes
compras_cliente1 <- c("Camisa", "Pantalon", "Corbata", "Zapatos", "Medias")
compras_cliente2 <- c("Pantalon", "Zapatos", "Jean", "Sombrero", "Chaqueta")
compras <- data.frame(Cliente = c(rep("Cliente1", length(compras_cliente1)), rep("Cliente2", length(compras_cliente2))),
                      Ropa = c(compras_cliente1, compras_cliente2))

# Crear todas las posibles combinaciones de clientes
clientes <- unique(compras$Cliente)
combinaciones <- expand.grid(clientes, clientes)
combinaciones <- combinaciones[combinaciones[,1] != combinaciones[,2],] # Eliminar combinaciones repetidas

# Inicializar la matriz de distancias Jaccard con valores cero
distancias_jaccard <- matrix(0, nrow = length(clientes), ncol = length(clientes))

# Calcular la distancia Jaccard para cada par de clientes y actualizar la matriz de distancias
for (i in 1:nrow(combinaciones)) {
  cliente1 <- combinaciones[i,1]
  cliente2 <- combinaciones[i,2]
  compras_cliente1 <- compras[compras$Cliente == cliente1, "Ropa"]
  compras_cliente2 <- compras[compras$Cliente == cliente2, "Ropa"]
  jaccard_distance <- 1 - length(intersect(compras_cliente1, compras_cliente2)) / length(union(compras_cliente1, compras_cliente2))
  distancias_jaccard[cliente1, cliente2] <- jaccard_distance
  distancias_jaccard[cliente2, cliente1] <- jaccard_distance
}

# Imprimir la matriz de distancia Jaccard
distancias_jaccard

###EJEMPLO 3

# crear un dataframe con las ventas de los productos
ventas <- data.frame(producto_1 = c(1, 1, 0, 1, 0, 1), 
                     producto_2 = c(0, 1, 1, 0, 1, 1),
                     producto_3 = c(1, 0, 1, 1, 0, 0),
                     producto_4 = c(1, 1, 0, 0, 0, 1),
                     producto_5 = c(0, 1, 0, 1, 1, 1))

# imprimir el dataframe de ventas
ventas

# calcular la distancia Jaccard
dist_jac <- 1 - dist(ventas, method = "binary")

# imprimir la matriz de distancia Jaccard
dist_jac


### EJEMPLO 4

# Crear un data frame con los datos de las ventas de cada producto por cliente
ventas <- data.frame(
  Cliente_1 = c(1, 0, 1, 1, 0),
  Cliente_2 = c(1, 1, 0, 1, 1),
  Cliente_3 = c(0, 1, 1, 0, 0),
  Cliente_4 = c(1, 0, 1, 0, 1),
  Cliente_5 = c(0, 1, 0, 0, 1),
  Cliente_6 = c(1, 1, 0, 1, 1)
)

# Calcular la matriz de distancia de Jaccard
# Primero se calcula la matriz cuadrada de distancia
dist_jac_sq <- as.matrix(dist(t(ventas), method = "jaccard", diag = TRUE, upper = TRUE))

# Luego se convierte en una matriz simétrica
dist_jac_sq[lower.tri(dist_jac_sq)] <- t(dist_jac_sq)[lower.tri(dist_jac_sq)]

# Establecer los nombres de fila y columna de la matriz
rownames(dist_jac_sq) <- colnames(dist_jac_sq) <- paste("Cliente", 1:6, sep = "_")

# Mostrar la matriz de distancia de Jaccard resultante
dist_jac_sq

