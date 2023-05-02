library(grid)
library(gtable)
suppressWarnings(library(gridExtra))
suppressWarnings(library(tibble))

tabla_cuadricula <- matrix(c("Cualitativo", "✓", "✓", "", "", "", "",
                             "Cuantitativo", "", "", "", "✓", "", "✓",
                             "Mixto", "", "", "✓", "", "", ""), 
                           nrow = 3, byrow = TRUE)

colnames(tabla_cuadricula) <- c("Tipos", "Hamming", "Jaccard", "Gower", "Euclidiana", "Manhattan", "Mahalanobis")

tabla_cuadricula <- as.data.frame(tabla_cuadricula)

tabla_cuadricula[tabla_cuadricula == "✓"] <- "✓"
tabla_cuadricula[tabla_cuadricula == ""] <- ""
tabla_cuadricula[tabla_cuadricula$Tipos == "Cuantitativo", "Manhattan"] <- "✓"

tabla_cuadricula <- as_tibble(tabla_cuadricula)

tema <- ttheme_default(
  core=list(
    bg_params=list(fill=c("white", "#DDDDDD")),
    fg_params=list(fontface=c(1,0), fontsize=c(11,11)),
    hjust=c("center","center","center","center","center","center","center")
  )
)

tabla_cuadricula <- tableGrob(
  as.matrix(tabla_cuadricula),
  rows = NULL,
  theme = tema
)

grid.newpage()
grid.draw(tabla_cuadricula)



