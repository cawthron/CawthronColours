#' Complete list of palettes
#'
#' Official Cawthron colour palettes. Use \code{\link{get_pal}} to extract palettes.
#'
#' @export
cawthron_palettes <- list(
  Hihi = c("#070604", "#F9E211", "#797A87", "#A8ACAD", "#D6CBB5"),
  Hoiho = c("#CABEE9", "#7C7189", "#FAE093", "#D04E59", "#BC8E7D", "#2F3D70"),
  Kaka =  c("#A7473A", "#4B5F6C", "#B09B37", "#955F47", "#A8B9CB"),
  Kakapo = c("#7D9D33", "#CED38C", "#DCC949", "#BCA888", "#CD8862", "#775B24"),
  Kakariki =  c("#44781E", "#A1B654", "#2C3B75", "#B8321A", "#565052")
)

#' Select Cawthron palette
#'
#' Return official Cawthron colour palettes.
#'
#' @param name Name of desired palette. Choices are: \code{Hihi}, \code{Hoiho}, \code{Kaka}, \code{Kakariki}, and \code{Kakapo}.
#'
#' @return A vector of colours.
#' @export
#' @examples
#' get_pal("Hihi")
get_pal <- function(name) {

  pal <- cawthron_palettes[[name]]
  if (is.null(pal))
    stop("Palette not found.")

  pal
}

#' Plots a colour palette
#'
#' @param col_pal a vector of colours
#' @export
#' @importFrom graphics par image
#' @examples
#' my_col_pal <- get_pal("Kakapo")
#' print_pal(my_col_pal)
print_pal <- function(col_pal) {
  n <- length(col_pal)
  old <- par(mar = c(0.5, 0.5, 0.5, 0.5))
  on.exit(graphics::par(old))

  graphics::image(1:n, 1, as.matrix(1:n), col = col_pal,
        ylab = "", xaxt = "n", yaxt = "n", bty = "n")
}


#' Continuous colour palettes
#'
#'  Generate a continuous colour palette based on one of the existing colour palettes.
#'
#' @param pal name of the colour palette to extract two gradient end points from.
#' @param col_index index of the two end point colours.
#' @param gradient_n number of colours in the continuous gradient
#'
#' @return a vector of colours
#' @importFrom grDevices colorRampPalette
#' @export
#' @examples
#' my_con_pal <- continuous_pal(pal = "Hihi", col_index = c(1,2), gradient_n = 100)
#' print_pal(my_con_pal)
continuous_pal <- function(pal = "Hihi", col_index = c(1,2), gradient_n = 100) {
  selected_colours <- get_pal(pal)[col_index]
  grDevices::colorRampPalette(selected_colours)(gradient_n)
}

