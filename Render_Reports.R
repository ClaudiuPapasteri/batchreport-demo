## Automatically Render Multiple Reports based on Parameters
#########################################################################

# ! Here "region" is the defined parameter in .Rmd

## This renders the Report for 1 value of the Parameter (e.g. "Mountain") 
# rmarkdown::render("Report_ScriptTemplate.Rmd", 
#                   params = list(region = "Mountain"))        

## This renders the Report for all values of the Parameter
library(purrr)

render_report <- function(regionvar){
  template <- "Report_ScriptTemplate.Rmd"
  outfile <- sprintf("Report_ScriptTemplate_%s.html", regionvar)
  parameters <- list(region = regionvar)
  rmarkdown::render(template,
                    output_dir = "docs",           # make output_dir "docs" folder
                    output_file = outfile,   
                    output_format = "all",         # render multiple formats specified in YAML header   
                    params = parameters)
  invisible(TRUE)
}

# render_report("Pacific")   # TEST IT: This renders the Report for 1 value of the Parameter (e.g. "Pacific")

params_list <- list(list("East North Central",                         # here set param values
                         "East South Central", "Middle Atlantic",
                         "Mountain", "New England", "Pacific",
                         "South Atlantic", "West North Central",
                         "West South Central"))
purrr::pmap(params_list, render_report)


