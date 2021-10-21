
options(shiny.maxRequestSize = 200*1024^2)

shinyServer(
  function(input, output, session){
    observe({
      if(input$submit1 > 0) {
        isolate({
          ridgelin.height <<- input$ridgelinHeight
          ridgelin.width <<- input$ridgelinWidth
          
          if(input$seluploaddata == "1"&& !is.null(input$Upload_data)) {
            data_info <- file.info(input$Upload_data$datapath)
            if(data_info$size == 0) {
              sendSweetAlert(
                session = session,
                title = "Error !!",
                text = "The file can't be empty.",
                type = "error"
              )
            } else {
              data <- read.table(input$Upload_data$datapath,  sep = "\t", head = T, as.is = T)
              data <- as.data.frame(data)
              if(dim(data)[2] != 2) {
                sendSweetAlert(
                  session = session,
                  title = "Data formatting error !", type = "error",
                  text = "Please check the input data format!"
                )
              } 
            }
          }
          
          if(input$seluploaddata == "2" && !is.null(input$Paste_data)) {
            if (input$Paste_data == "") {
              sendSweetAlert(
                session = session,
                title = "No input data received!", type = "error",
              )
            } else {
              data <- unlist(strsplit(input$Paste_data,"\n"))
              data <- strsplit(data,"\t")
              if(length(data[[1]]) != 2)  {
                sendSweetAlert(
                  session = session,
                  title = "Data formatting error !", type = "error",
                  text = "Please check the input data format!"
                )
              }
              data <- do.call(rbind, data)
              data <- as.data.frame(data)
              colnames(data) <- data[1, ]
              data <- data[-1,]
              data[,2] <- as.numeric(data[,2])
              
            }
          }
          
          ggmar <- function() {
            if (input$coltypeplot == "1") {
              if(input$selectcolor == "1") {
                p1 <- ggplot(data, aes(x = data[,2], y = data[,1],fill=data[,1])) +
                  geom_density_ridges(scale = input$var8) +
                  theme_ridges()+ 
                  theme(legend.position = "none")+
                  labs(title = input$plotTitle,x = input$xlabtitle, y = input$ylabtitle)+
                  theme(plot.title=element_text(hjust=0.5))+
                  theme(axis.title =element_text(size = input$var9))+
                  theme(plot.title=element_text(size = input$plotsize))+
                  theme(axis.text=element_text(size = input$axissize))+
                  scale_fill_manual(values=rainbow(length(unique(data[,1])))) 
                return(p1)
              }
              
              if(input$selectcolor == "2") {
                p1 <- ggplot(data, aes(x = data[,2], y = data[,1],fill=data[,1])) +
                  geom_density_ridges(scale = input$var8) +
                  theme_ridges()+ 
                  theme(legend.position = "none")+
                  labs(title = input$plotTitle,x = input$xlabtitle, y = input$ylabtitle)+
                  theme(plot.title=element_text(hjust=0.5))+
                  theme(axis.title =element_text(size = input$var9))+
                  theme(plot.title=element_text(size = input$plotsize))+
                  theme(axis.text=element_text(size = input$axissize))+
                  scale_fill_manual(values=hcl.colors(length(unique(data[,1])))) 
                return(p1)
              }
              
              if(input$selectcolor == "3") {
                p1 <- ggplot(data, aes(x = data[,2], y = data[,1],fill=data[,1])) +
                  geom_density_ridges(scale = input$var8) +
                  theme_ridges()+ 
                  theme(legend.position = "none")+
                  labs(title = input$plotTitle,x = input$xlabtitle, y = input$ylabtitle)+
                  theme(plot.title=element_text(hjust=0.5))+
                  theme(axis.title =element_text(size = input$var9))+
                  theme(plot.title=element_text(size = input$plotsize))+
                  theme(axis.text=element_text(size = input$axissize))+
                  scale_fill_manual(values=heat.colors(length(unique(data[,1])))) 
                return(p1)
              }
              
              if(input$selectcolor == "4"){
                p1 <- ggplot(data, aes(x = data[,2], y = data[,1],fill=data[,1])) +
                  geom_density_ridges(scale = input$var8) +
                  theme_ridges()+ 
                  theme(legend.position = "none")+
                  labs(title = input$plotTitle,x = input$xlabtitle, y = input$ylabtitle)+
                  theme(plot.title=element_text(hjust=0.5))+
                  theme(axis.title =element_text(size = input$var9))+
                  theme(plot.title=element_text(size = input$plotsize))+
                  theme(axis.text=element_text(size = input$axissize))+
                  scale_fill_manual(values=terrain.colors(length(unique(data[,1])))) 
                return(p1)
              }
              
              if(input$selectcolor == "5"){
                p1 <- ggplot(data, aes(x = data[,2], y = data[,1],fill=data[,1])) +
                  geom_density_ridges(scale = input$var8) +
                  theme_ridges()+ 
                  theme(legend.position = "none")+
                  labs(title = input$plotTitle,x = input$xlabtitle, y = input$ylabtitle)+
                  theme(plot.title=element_text(hjust=0.5))+
                  theme(axis.title =element_text(size = input$var9))+
                  theme(plot.title=element_text(size = input$plotsize))+
                  theme(axis.text=element_text(size = input$axissize))+
                  scale_fill_manual(values=topo.colors(length(unique(data[,1])))) 
                return(p1)
              }
              
              if(input$selectcolor == "6"){
                p1 <- ggplot(data, aes(x = data[,2], y = data[,1],fill=data[,1])) +
                  geom_density_ridges(scale = input$var8) +
                  theme_ridges()+ 
                  theme(legend.position = "none")+
                  labs(title = input$plotTitle,x = input$xlabtitle, y = input$ylabtitle)+
                  theme(plot.title=element_text(hjust=0.5))+
                  theme(axis.title =element_text(size = input$var9))+
                  theme(plot.title=element_text(size = input$plotsize))+
                  theme(axis.text=element_text(size = input$axissize))+
                  scale_fill_manual(values=cm.colors(length(unique(data[,1])))) 
                return(p1)
              }
            } else {
              col.input <- gsub("\\s","", strsplit(input$colorplot, ",")[[1]])
              p1 <- ggplot(data, aes(x = data[,2], y = data[,1],fill=data[,1])) +
                geom_density_ridges(scale = input$var8) +
                theme_ridges()+ 
                theme(legend.position = "none")+
                labs(title = input$plotTitle,x = input$xlabtitle, y = input$ylabtitle)+
                theme(plot.title=element_text(hjust=0.5))+
                theme(axis.title =element_text(size = input$var9))+
                theme(plot.title=element_text(size = input$plotsize))+
                theme(axis.text=element_text(size = input$axissize))+
                scale_fill_manual(values=col.input) 
              return(p1) 
            }
          }
          
          output$ridgeplot <- renderPlot({  
            ggmar()
          })
        })
      } else{
        NULL
      }
      ## *** Download example data ***
      output$Example_data.txt <- downloadHandler(
        filename <- function() {
          paste('Example_data.txt')
        },
        content <- function(file) {
          input_file <- "Example_data.txt"
          example_dat <- read.table(input_file, head = T, as.is = T, sep = "\t", quote = "")
          write.table(example_dat, file = file, row.names = F, quote = F, sep = "\t")
        }, contentType = 'text/csv') 
      
      ## paste example input 
      observe({
        if (input$Paste_example >0) {
          isolate({
            exam <- readLines("Example_data.txt")
            updateTextAreaInput(session, "Paste_data", value = paste0(exam,collapse = "\n"))
          })
        } else {NULL}
      })
      
      ## Download PDF file of ridgeline
      output$downloadridge.pdf <- downloadHandler(
        filename <- function() { paste('ridgeline.pdf') },
        content <- function(file) {
          pdf(file,width = ridgelin.width , height = ridgelin.height)
          p2 <- ggmar()
          grid.draw(p2)
          dev.off()
        }, contentType = 'application/pdf')
      
      ## Download SVG file of ridgeline
      output$downloadridge.svg <- downloadHandler(
        filename <- function() { paste('ridgeline.svg') },
        content <- function(file) {
          svg(file,width = ridgelin.width, height = ridgelin.height)
          p2 <- ggmar()
          grid.draw(p2)
          dev.off()
        }, contentType = 'image/svg')
      
    })
  }
)

