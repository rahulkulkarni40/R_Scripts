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

```python
selectInput("TagColor", "Color of my Tag",choices=c("Red","Blue","Yellow","Black", "grey","orange","pink","purple"), 
                selected = "Red", multiple = FALSE)),
  ```
Here 
- Id is `TagColor` 
- Choices is the list of options to be displayed for the User for selection, 
- `Selecte="Red"` Means by Default it is Red
- `multiple = FALSE` Which means disabling multiple selection options.


```python
div(style="width:300px;padding-left:10px;",fluidRow(verbatimTextOutput("Pop",placeholder = TRUE)))
```
Here 
- `Div` Is division tage same as HTML
- `Style="width:300px;padding-left:10px;"` Here you are asigning style for that specific Division 
- `fluidRow()`  Rows exist for the purpose of making sure their elements appear on the same line (if the browser has adequate width)
- `verbatimTextOutput("Pop",placeholder = TRUE)`
  * Arguments:
  *  `outputId`	output variable to read the value from i.e **Pop**
  * `placeholder`	if the output is empty or NULL, should an empty rectangle be displayed to serve as a placeholder? (does not affect behavior when the the output in nonempty) 


## Server Code 
``` python
observe( **Code for the operations to be done**)
```
Create a reactive observer i.e as soon as any event or operation happens to that shiny page

``` Python
d <- input$TagColor
```

Storing the input value i.e `selectInput` value into a variable. i.e TagColor

``` python
color <- paste0("solid ", tolower(color))
``` 
Converting to lower case

```python
 runjs(paste0("document.getElementById('Pop').style.border ='",color,"'"))
 ````
 To run javascript code 
 
 ```python
 
 output$Pop <-renderText({d})
 ```
 
 This is used to render the value to that perticular output id 
 
 
 Result output Screen:
 
 ![](https://github.com/rahulkulkarni40/R_Scripts/blob/master/Border_Color/border-color.PNG)
