## Introduction 

This Shiny Application is used to created border color for any Output Text box in shiny application or any item of the R shiny 

## Requirenments 

> install.packages("shiny")

> install.packages("shinyjs")

Shiny and Shinyjs packages for this application 

## Code Details 
To get started, open its app.R file. Edit the script to match the one below:
```python
library(shiny)

# Define UI ----
ui <- fluidPage(
  
)

# Define server logic ----
server <- function(input, output) {
  
}

# Run the app ----
shinyApp(ui = ui, server = server)
```
This code is the bare minimum needed to create a Shiny app. The result is an empty app with a blank user interface, an appropriate starting point for this lesson.

## UI Layout
Shiny uses the function fluidPage to create a display that automatically adjusts to the dimensions of your user’s browser window. You lay out the user interface of your app by placing elements in the fluidPage function.

For example, the ui function below creates a user interface that has a title panel and a sidebar layout, which includes a sidebar panel and a main panel. Note that these elements are placed within the fluidPage function.


titlePanel and sidebarLayout are the two most popular elements to add to fluidPage. They create a basic Shiny app with a sidebar.

sidebarLayout always takes two arguments:

- sidebarPanel function output

- mainPanel function output

## Server File 

