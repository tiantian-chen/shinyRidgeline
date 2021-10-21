
library(shiny)
library(ggridges)
library(ggplot2)
library(shinyjqui)
library(ggExtra)
library(shinyWidgets)
library(shinythemes)
library(shinyBS)
library(RLumShiny)
library(grid)

shinyUI(
  navbarPage(
    title="shinyridgeline",
    theme=shinytheme("flatly"),
    windowTitle="make ridgeline plots in R with shiny",
    
    tabPanel("Ridgeline",
             sidebarPanel(width=3,
                          selectInput("seluploaddata", h4("Input Data",
                                                          bsButton("bs00", label="", icon=icon("question"), style="info", size="small")
                          ), c("Upload input data" = "1", "Paste input data" = "2"), "2"),
                          bsPopover("bs00", 'Select Input data type', "可上传或粘贴输入数据，输入数据应该包含两列，分别对应横轴和纵轴的数值", trigger = "focus"),
                          conditionalPanel(condition="input.seluploaddata == '1'",
                                           fileInput("Upload_data", label="", multiple = FALSE),
                                           downloadButton("Example_data.txt", "Download example data"),
                          ),
                          
                          conditionalPanel(condition="input.seluploaddata == '2'",
                                           textAreaInput("Paste_data", label="", width="100%", resize="vertical", 
                                                         height="200px", placeholder = "Paste text to upload data"),
                                           actionButton("Paste_example", strong("Paste example data"), styleclass = "info", width='100%'),
                          ),
                          br(),
                          
                          radioButtons("coltypeplot", h4("Data color",
                                                         bsButton("bsq5",label = "",icon = icon("question"),style = "info",size = "small")
                          ), c("System color" = "1", "Custom color" = "2"), selected="1"),
                          bsPopover("bsq5","用于渲染数据的颜色，可以由应用程序随机分配，也可以由用户指定。默认情况下，将使用shiny指定的颜色。若要自定义数据的一种颜色，用户应给每个数据选择颜色。",
                                    trigger = "focus"),
                          conditionalPanel(condition="input.coltypeplot=='1'",	
                                           selectInput("selectcolor", NULL, 
                                                       choices = list("rainbow.colors" = 1, "hcl.colors" = 2, "heat.colors" = 3,"terrain.colors" = 4,"topo.colors" = 5,"cm.colors" = 6), 
                                                       selected = 1)
                          ),
                          
                          conditionalPanel(condition="input.coltypeplot=='2'",
                                           textInput("colorplot", NULL, value="red,blue,cyan,gold,grey")
                          ),
                          
                          textInput("plotTitle", h4("Plot title:",
                                                    bsButton("bs0", label = "", icon = icon("question"), style = "info", size = "small")
                          ), value = c("plot title")
                          ),
                          bsPopover("bs0", "修改图片标题。", trigger = "focus"),
                          
                          textInput("xlabtitle", h4("X axis title:",
                                                    bsButton("bs1", label = "", icon = icon("question"), style = "info", size = "small")
                          ), value = c("X axis")
                          ),
                          bsPopover("bs1", "修改x轴标题。", trigger = "focus"),
                          
                          textInput("ylabtitle", h4("Y axis title:",
                                                    bsButton("bs2", label = "", icon = icon("question"), style = "info", size = "small")
                          ), value = c("Y axis")
                          ),
                          bsPopover("bs2", "修改y轴标题。", trigger = "focus"),
                          
                          sliderInput("plotsize", h4("Plot title font size",
                                                     bsButton("bsq44",label = "",icon = icon("question"),style = "info",size = "small")),
                                      min = 10, max = 50,
                                      value = 25, step = 1),
                          bsPopover("bsq44","用于修改图片标题的大小。",trigger = "focus"),
                          
                          sliderInput("axissize", h4("Axis label font size",
                                                     bsButton("bsq444",label = "",icon = icon("question"),style = "info",size = "small")),
                                      min = 10, max = 30,
                                      value = 15, step = 1),
                          bsPopover("bsq444","用于修改轴标签字体的大小。",trigger = "focus"),
                          
                          sliderInput("var9", h4("Axis title font size",
                                                 bsButton("bsq4444",label = "",icon = icon("question"),style = "info",size = "small")),
                                      min = 10, max = 50,
                                      value = 25, step = 1),
                          bsPopover("bsq4444","用于修改轴标题字体的大小。",trigger = "focus"),
                          
                          sliderInput("var8", h4("Plot overlap degree",
                                                 bsButton("bsq44444",label = "",icon = icon("question"),style = "info",size = "small")),
                                      min = 1, max = 10,
                                      value = 1, step = 0.01),
                          bsPopover("bsq44444","用于重叠程度。",trigger = "focus"),
                          
                          checkboxInput("downloadratio", "Adjust the image download ratio", FALSE),
                          conditionalPanel(
                            condition = "input.downloadratio",
                            numericInput("ridgelinHeight", "Plot download height", value="20"),
                            numericInput("ridgelinWidth", "Plot download width", value="10")) ,
                          
                          actionButton("submit1", strong("Submit!"), styleclass = "success", width='100%') 
             ),
             
             mainPanel(
               downloadButton("downloadridge.pdf", "Download PDF File"),
               downloadButton("downloadridge.svg", "Download SVG File"),
               
               jqui_resizable(plotOutput("ridgeplot", width = "60%", height = "700px"))
             )
    ),
    
    tabPanel("Help",
             includeMarkdown("README.md"))
  )
)

