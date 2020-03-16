## Introduction 

This Shiny Application is created for googleVis Guage in shiny application 

## Requirenments 

> install.packages("shiny")

> install.packages("googleVis")

Shiny and googleVis packages for this application 

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

```python
numericInput('n1', 'Enter your Base Accuracy', 40, 0.5, 100),
 column(4,htmlOutput("view1")),
```
The item use here is NumericInput which has :
- ID as `n1`
- Text `Enter your Base Accuracy` as text
- Range `40, 0.5, 100` (Value,Minimum,Maximun)

And HTML Output name view1


## Server code

```python
output$view1 <- renderGvis({
    df1 <- data.frame(Label = "Base Accuracy", Value = input$n1)
    gvisGauge(df1,
              options=list(min=0, max=150, greenFrom=120,
                           greenTo=150, yellowFrom=75, yellowTo=119.9,
                           redFrom=0, redTo=74.99, width=300, height=300));  
    
  })
```

Here output for view1 is of type renderGvis

Additiona details: [link](https://www.rdocumentation.org/packages/googleVis/versions/0.6.2/topics/renderGvis)

`df1` is the dataframe with value as input from `numberinput`


## Result Output

