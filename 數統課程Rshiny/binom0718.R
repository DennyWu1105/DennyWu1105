library(shiny)
ui <- fluidPage(
  titlePanel("Binomal Distribution"),
  tabsetPanel(
    tabPanel("Plot",
             sidebarPanel(
               sliderInput(inputId = "n", label = "Number of Trials n", 
                           value = 10, min = 0, max = 20),
               sliderInput(inputId = "p", label = "Probability of Success p", 
                           value = 0.3, min = 0, max = 1)
             ),
             mainPanel(
               plotOutput("binomcurve")))
  ))

server <- function(input,output){
  output$binomcurve <- renderPlot({
    n=input$n; p=input$p
    y <- dbinom(0:n, n, p)
    plot(0:n, y, ylim=c(0, max(y)), xlim=c(0, n), xlab="Trials",
         ylab="Probability", type="h", lwd=12)
  })
}

shinyApp(ui = ui, server = server)
