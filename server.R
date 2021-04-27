server <- function(input, output, session) {
    output$samplesize <- renderText({
        size <- sample.size.mean(input$e, input$S, N = Inf, level = 0.95)
        paste0('Assuming N=Inf the Sample Size needed is: ', size$n)
    })
}

shinyApp(ui, server)