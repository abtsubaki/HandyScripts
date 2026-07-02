theme_standard_text <- function(base_size = 14, base_family = "") {
  library(ggplot2)
  # convenience sizes derived from base_size
  title_size      <- base_size + 4
  subtitle_size   <- base_size + 2
  axis_title_size <- base_size
  axis_text_size  <- max(8, base_size - 2)
  legend_title_sz <- max(9, base_size - 1)
  legend_text_sz  <- max(8, base_size - 2)
  strip_text_sz   <- max(9, base_size - 1)
  
  theme_minimal(base_size = base_size, base_family = base_family) +
    theme(
      # plot title / subtitle
      plot.title = element_text(size = title_size, face = "bold", hjust = 0, margin = margin(b = 6)),
      plot.subtitle = ggtext::element_textbox(
        size   = axis_text_size,
        hjust  = 0,
        width  = unit(0.95, "npc"),       # keep < 1 to wrap inside plot area
        padding = unit(c(5, 5, 5, 5), "pt"),
        margin = ggplot2::margin(b = 6)
      ),
      plot.title.position = "plot",       # allow subtitle to use full plot width
      
      # axis titles and tick labels
      axis.title = element_text(size = axis_title_size),
      axis.title.x = element_text(margin = margin(t = 6)),
      axis.title.y = element_text(margin = margin(r = 6)),
      axis.text = element_text(size = axis_text_size, colour = "black",  angle = 90, hjust = 1),
      axis.ticks.length = unit(3, "pt"),
      
      # legend
      legend.title = element_text(size = legend_title_sz),
      legend.text  = element_text(size = legend_text_sz),
      legend.key.size = unit(8, "pt"),
      
      # facet strips
      strip.text = element_text(size = strip_text_sz, face = "bold"),
      
      # minor visual tweaks
      panel.grid.major = element_line(linewidth = 0.35, colour = "grey90"),
      panel.grid.minor = element_blank(),
      panel.border = element_blank()
    )
}

# Helper to set globally once in script:
set_standard_theme <- function(base_size = 14, base_family = "") {
  ggplot2::theme_set(theme_standard_text(base_size = base_size, base_family = base_family))
}

# Example usage:
# 1) per-plot
# p + theme_standard_text(base_size = 16)
# 2) set globally (call once near top of script)
# set_standard_theme(base_size = 15, base_family = "Helvetica")