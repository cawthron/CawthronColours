#' List of available palettes
#'
#' Official Cawthron colour palettes. Use \code{\link{get_pal}} to extract palettes.
#'
#' Palettes include:
#'
#'  * categorical: \code{caw_cat_1}, \code{caw_cat_2}
#'  * diverging: \code{caw_div_1}, \code{caw_div_2}, \code{caw_div_3}
#'  * sequential: \code{caw_seq_1}, \code{caw_seq_2}, \code{caw_seq_3}, \code{caw_seq_4}, \code{caw_seq_5}
#'
#' @export
cawthron_palettes <- list(
  #------Define colour palettes: DIVERGING ------#
  caw_div_1 = c("#85243f", "#c22c43", "#ec7d49", "#fed087", "#F1e6b2", "#f4f2e4", "#c6e7df", "#80ccb8", "#54b598", "#007377", "#004851"),
  caw_div_2 = c("#8d2d1f", "#ba5000", "#ef9033", "#e0b27c", "#f2e3c2", "#f8fcff", "#c6dce8", "#77c0e5", "#1e82c6", "#2b5a89", "#163e5e"),
  caw_div_3 = c("#225733", "#228848", "#6cc24a", "#a4cf60", "#d1debb", "#f4f4e6", "#bfe6ec", "#5ca5db", "#047ab0", "#245389", "#203f6b"),

  #------Define colour palettes: SEQUENTIAL ------#
  caw_seq_1 = c("#f9f7eb", "#D9E1E2", "#BFCEC2", "#8cB59e", "#67a392", "#54827a", "#447873", "#1e5b5c", "#133f3d", "#0d3331"),
  caw_seq_2 = c("#fbe515", "#abd037", "#6cbe49", "#24a26c", "#1d8778", "#226a7b", "#284f7a", "#303575", "#372464", "#330a40"),
  caw_seq_3 = c("#f9f39d", "#ede655", "#c3d142", "#99bc42", "#4bad48", "#359646", "#2a7d3e", "#1a5e30", "#1e4425", "#093322"),
  caw_seq_4 = c("#eff8fd", "#c7dced", "#a0c1de", "#77a6d0", "#4f8bc0", "#2771b0", "#0056a0", "#10497e", "#0e3e63", "#073450"),
  caw_seq_5 = c("#FDEAD3", "#FDDAAD", "#FDD086", "#FFAA4D", "#FF8F1C", "#DC6B2F", "#E04E39", "#9E2A2B", "#76232F", "#3F2021"),

  #------Define colour palettes: Categorical 1 ------#
  caw_cat_1 = c("#f48521", "#fbd872", "#acd58e", "#76c044", "#4a7637", "#2f4926", "#4ba791", "#2f725e", "#004f52", "#175c7d", "#029cbd", "#7ac4d3", "#9b99cd", "#6860a0", "#702365", "#e8b5d4", "#85243f", "#c22c43", "#d45f74", "#f8d3ca"),

  #------Define colour palettes: Categorical 2 ------#
  caw_cat_2 = c("#7f1424", "#bc3635", "#ffcc28", "#fbb15d", "#ffe0ae", "#c45b28", "#9ecce5", "#3398d2", "#00549e", "#175c7d", "#d383b7", "#a184bd", "#35356d", "#c3d3c2", "#75a54a", "#205128", "#67bd45", "#c3ce58", "#737f7e", "#083631")
)




#' Select Cawthron palette
#'
#' Return official Cawthron colour palettes.
#'
#' @param name Name of desired palette. Choices are:
#'
#'  * categorical: \code{caw_cat_1}, \code{caw_cat_2}
#'  * diverging: \code{caw_div_1}, \code{caw_div_2}, \code{caw_div_3}
#'  * sequential: \code{caw_seq_1}, \code{caw_seq_2}, \code{caw_seq_3}, \code{caw_seq_4}, \code{caw_seq_5}
#'
#' @return A vector of colours.
#' @export
#' @examples
#' get_pal("caw_div_1")
get_pal <- function(name) {

  pal <- cawthron_palettes[[name]]
  if (is.null(pal))
    stop("Palette not found.")

  pal
}

#' Plots a colour palette
#'
#' Visually inspect the given colour palette.
#'
#' @param col_pal a vector of colours
#' @export
#' @importFrom graphics par image
#' @examples
#' my_col_pal <- get_pal("caw_div_3")
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
#' @param gradient_n number of colours in the continuous gradient
#'
#' @return a vector of colours
#' @importFrom grDevices colorRampPalette
#' @export
#' @examples
#' my_con_pal <- continuous_pal(pal = "caw_div_3", gradient_n = 100)
#' print_pal(my_con_pal)
continuous_pal <- function(pal = "caw_div_3", gradient_n = 100) {
  selected_colours <- get_pal(pal)
  grDevices::colorRampPalette(selected_colours)(gradient_n)
}