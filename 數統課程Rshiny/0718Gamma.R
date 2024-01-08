library(shiny)
library(ggplot2)

# UI部分
ui <- fluidPage(
  titlePanel("Gamma分布圖"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("alpha", "Alpha", min = 0.1, max = 10, value = 2),
      sliderInput("beta", "Beta", min = 0.1, max = 10, value = 2),
      actionButton("update", "更新圖形")
    ),
    mainPanel(
      plotOutput("gammaPlot")
    )
  )
)

# Server部分
server <- function(input, output) {
  data <- reactive({
    x <- seq(0, 100, length.out = 100)
    y <- dgamma(x, shape = input$alpha, rate = input$beta)
    data.frame(x = x, y = y)
  })
  
  output$gammaPlot <- renderPlot({
    ggplot(data(), aes(x, y)) +
      geom_line(color = "blue", size = 2
      ) +
      labs(title = "Gamma分布圖",
           x = "數值",
           y = "密度")
  })
}

# 啟動Shiny應用程序
shinyApp(ui = ui, server = server)
