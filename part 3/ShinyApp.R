library(shiny)
ui<- fluidPage(
  titlePanel("Visualisation of Flu Data"),
  
  fluidRow(
    column(4, wellPanel(
      radioButtons("picture", "Graph:",
                   c("CDC Data", "Heat Map of tweets"))
    )),
    column(4,
           imageOutput("image1", height = 300),
           imageOutput("image2")
    )
  )
)

server<-
  function(input, output, session) {
    
    # image2 sends pre-rendered images
    output$image2 <- renderImage({
      if (is.null(input$picture))
        return(NULL)
      
      if (input$picture == "CDC Data") {
        return(list(
          src = "cdc heat map.png",
          contentType = "image/png",
          alt = "Face"
        ))
      } else if (input$picture == "Heat Map of tweets") {
        return(list(
          src = "flu heat map.png",
          filetype = "image/png",
          alt = "This is a chainring"
        ))
      }
      
    }, deleteFile = FALSE)
  }

shinyApp(ui, server)
