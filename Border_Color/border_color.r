library(shiny)
library(shinyjs)

ui<-shinyUI(
  fluidPage(
    useShinyjs(),
    selectInput("TagColor", "Color of my Tag",choices=c("Red","Blue",
                                                        "Yellow","Black", "grey","orange","pink","purple"), 
                selected = "Red", multiple = FALSE),
    verbatimTextOutput("Pop",placeholder = TRUE)
  )
)

server<-shinyServer(function(input, output) {
  observe({
    d <- input$TagColor
    color <- d
      color <- paste0("solid ", tolower(color))
      runjs(paste0("document.getElementById('Pop').style.border ='",color,"'"))
      output$Pop <-renderText({d})
  })
})

shinyApp(ui,server)