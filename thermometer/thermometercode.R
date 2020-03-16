library(shiny)

server <- function(input, output, session) {
  #... (not needed for this plot)
  output$thermometer <- renderPlot({
    z<-20
    z2 <- 100
    symbols(1, thermometers = cbind(20,100,z/z2), fg = 4, xlab =paste0(signif(z/z2 * 100,digits = 4), "%"), ylab = NA,bty='n', inches = 3, yaxt='n', xaxt='n', main = "thermo")
    #text(1, paste0(z/z2 * 100, "%"), pos = 1, offset = 2)
  })
}
ui <- fluidPage(
  plotOutput("thermometer")
)
shinyApp(ui = ui, server = server)