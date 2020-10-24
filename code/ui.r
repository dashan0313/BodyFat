library(shiny)

f <- function(x) {return(7.598992-1.355830*x[1]+0.369880*x[2]-1.664533*x[3]+
                           4.895043*x[4]-6.026065*x[5]+0.074661*x[6]+
                           1.621559*x[7]-0.371934*x[8]-0.198447*x[9]+
                           1.074049*x[10]-0.006896*x[2]*x[7]+0.060035*x[1]*x[5]-
                           0.042138*x[4]*x[10])}

ui <- fluidPage(
  titlePanel(h1(id='bigheader',"Body Fat Caculator",align = 'center')),
  tags$style(HTML("#bigheader{font-size: 50px;font-style: italic;}")),
  fluidRow(
    column(12,offset = 4,textOutput("sm"))
  ),
  fluidRow(
    column(3,offset = 4,
           numericInput("n1", label = h3("Abdomen 2 circ.(cm)"), value = 90.95)
           ),
    column(3, 
           numericInput("n2", label = h3("Weight(lbs)"), value = 176.5)
    )
  ),
  fluidRow(
    column(3, offset = 4,
           numericInput("n3", label = h3("Wrist circ.(cm)"), value = 18.3)
    ),
    column(3, 
           numericInput("n4", label = h3("Forearm circ.(cm)"), value = 28.7)
    )
  ),
  fluidRow(
    column(3, offset = 4,
           numericInput("n5", label = h3("Neck circ.(cm)"), value = 38)
    ),
    column(3, 
           numericInput("n6", label = h3("Age(years)"), value = 43)
    ),
  ),
  fluidRow(
    column(3, offset = 4,
           numericInput("n7", label = h3("Thigh circ.(cm)"), value = 59)
    ),
    column(3, 
           numericInput("n8", label = h3("Knee circ.(cm)"), value = 38.5)
    ),
  ),
  fluidRow(
    column(3, offset = 4,
           numericInput("n9", label = h3("Hip circ."), value = 99.3)
    ),
    column(3, 
           numericInput("n10", label = h3("Chest circ."), value = 99.65)
    ),
  ),
  fluidRow(
    column(4, offset = 6,
           submitButton("Caculate"))
  ),
  fluidRow(
    column(3, offset = 5,titlePanel(h1("Your Body Fat",align = 'center')),
           verbatimTextOutput("value",placeholder = TRUE),
    )
  ),
  fluidRow(
    column(12,offset = 4,textOutput("text")
    )
  )
)

server <- function(input, output) {
    output$sm <- renderText({'Please provide us with the following information so that we can estimate your body fat.(circ. = circumference)'})
    output$value = renderPrint({
      f(c(input$n1, input$n2,input$n3,input$n4,input$n5,input$n6,
          input$n7,input$n8,input$n9,input$n10))
    })
  # `value` will in the output
  output$text <- renderText({'Design by Jingshan Huang,Xiaotian Wang,Yuanyou Yao.Please email to jhuang456@wisc.edu if you meet any problem. Thank you !' })
}

shinyApp(ui = ui, server = server)


