library(shiny)
ui <- fluidPage(
  titlePanel("Geometric Distribution"),
  tabsetPanel(
    tabPanel("Plot",
             sidebarPanel(
               sliderInput(inputId = "p", label = "Probability of Success p", 
                           value = 0.5, min = 0, max = 1)
             ),
             mainPanel(
               plotOutput("geomcurve")))
  ))

server <- function(input,output){
  output$geomcurve <- renderPlot({
    p=input$p
    y <- dgeom(0:19, p)
    plot(1:20, y, xlab="Trials",
         ylab="Probability", type="h", lwd=2)
    axis(1,at=seq(1,20,1))
  })
}

shinyApp(ui = ui, server = server)
