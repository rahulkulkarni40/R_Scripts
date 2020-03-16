library(shiny)
library(googleVis)

ui =(fluidPage(
  titlePanel('Guage'),
  sidebarLayout(
    sidebarPanel(
      numericInput('n1', 'Enter your Base Accuracy', 40, 0.5, 100),
      
      
      numericInput('n2', 'Enter your Model Accuracy', 40, 0.5, 100)
    ),
    mainPanel(
      tabsetPanel(
        tabPanel("Accuracy Guage",
                 column(4,htmlOutput("view1")),
                 column(4,htmlOutput("view2"))
        )
      )
    ))))
server = function(input, output) {
  
  output$view1 <- renderGvis({
    df1 <- data.frame(Label = "Base Accuracy", Value = input$n1)
    gvisGauge(df1,
              options=list(min=0, max=150, greenFrom=120,
                           greenTo=150, yellowFrom=75, yellowTo=119.9,
                           redFrom=0, redTo=74.99, width=300, height=300));  
    
  })
  
  output$view2 <- renderGvis({
    df2 <- data.frame(Label = "Model Accuracy", Value = input$n2)
    gvisGauge(df2,
              options=list(min=0, max=150, greenFrom=120,
                           greenTo=150, yellowFrom=75, yellowTo=119.99,
                           redFrom=0, redTo=74.99, width=300, height=300));  
    
  })
}
runApp(list(ui = ui, server = server))