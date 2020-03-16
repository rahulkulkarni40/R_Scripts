#importing Library that is been istalled
library(shiny)
library(shinyjs)

#for creating or adding UI for the R Application
ui<-shinyUI(
  fluidPage(
    
    #Title of the page
    titlePanel("Border Color Example"),
    useShinyjs(),
    
    #Side Bar Layout
    sidebarLayout(
      
      # SIde Bar Panel
      sidebarPanel(
      
        # Select Iput is like combobox in HTML
        selectInput("TagColor", "Color of my Tag",choices=c("Red","Blue",
                                                        "Yellow","Black", "grey","orange","pink","purple"), 
                selected = "Red", multiple = FALSE)),
    #Main Panel
    mainPanel(
      
      #Paragraph Data
      p("This Application cahnges the Border Color of the Text Output."),
      
      #Bold Texts
      strong("On Change of Options in Select Input."),
      
      #new Line character
      br(),
      br(),
    
      #It is an Output box of R shiny Item
    div(style="width:300px;padding-left:10px;",fluidRow(verbatimTextOutput("Pop",placeholder = TRUE)))
  )))
)

server<-shinyServer(function(input, output) {
  # As soon as the event or data is occured
  observe({
    
    #Storing the input value to the variable 
    d <- input$TagColor
    #storing color value
    color <- d
    
    #Converting the string to lower case
    color <- paste0("solid ", tolower(color))
      
    #Setting the value on the basis of Id using Java script Package of R  
    runjs(paste0("document.getElementById('Pop').style.border ='",color,"'"))
      
    # dISPLAYING THE TEXT VALUE to the text out put in the UI
    output$Pop <-renderText({d})
  })
})

shinyApp(ui,server)