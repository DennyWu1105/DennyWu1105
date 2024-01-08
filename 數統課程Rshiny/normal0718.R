library(shiny)
library(ggplot2)

# UI部分
ui <- fluidPage(
  titlePanel("正態分佈圖"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("mean", "平均數", min = -10, max = 10, value = 0),
      sliderInput("sd", "標準差", min = 0.1, max = 5, value = 1),
      actionButton("update", "更新圖形")
    ),
    mainPanel(
      plotOutput("normalPlot")
    )
  )
)

# Server部分
server <- function(input, output) {
  data <- reactive({
    x <- seq(-10, 10, length.out = 100)
    y <- dnorm(x, mean = input$mean, sd = input$sd)
    data.frame(x = x, y = y)
  })
  
  output$normalPlot <- renderPlot({
    ggplot(data(), aes(x, y)) +
      geom_line(color = "blue", size = 2) +
      labs(title = "正態分佈圖",
           x = "數值",
           y = "密度")
  })
}

# 啟動Shiny應用程序
shinyApp(ui = ui, server = server)
