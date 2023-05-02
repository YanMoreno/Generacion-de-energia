library(knitr)
library(kableExtra)
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

# Crear la tabla usando kableExtra y correrla hacia arriba
kable(tabla_cuadricula, "html") %>%
  kable_styling(bootstrap_options = "striped", full_width = F) %>%
  scroll_box(height = "200px", width = "100%")

