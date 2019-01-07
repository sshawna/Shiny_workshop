shinyUI(
  navbarPage("Name of Dashboard", fluid=TRUE,
             ##### Intro #####                    
             tabPanel("First tab",              
                      fluidRow(
                        column(width = 6,
                               tabsetPanel(id= "tabs",
                                           tabPanel("Fishing Grounds", value = "A", 
                                                    p(), htmlOutput("intro_tabset1"),
                                                    div(p(HTML(paste0('Funding for this project was provided by the EMFF ',br(),
                                                                      p(),
                                                                      img(src="Logos/Irelands_EU_ESIF_2014_2020_en.jpg", width = "300px", height = "100px")))))),
                                           tabPanel("Irish Ports", value = "B", 
                                                    p(), imageOutput("tabmap2", inline=TRUE),
                                           tabPanel("Types of Gear", value = "C", 
                                                    p(), htmlOutput("intro_tabset3"),
                                                    p(),
                                                    hr(),
                                                    column(6,
                                                           selectInput("gearpic",label="Diagram of fishing gear type",
                                                                       choices =  list("Beam trawl"= 1, "Gillnet"= 2, 
                                                                                       "Midwater trawl"= 3,"Otter trawl"= 4,
                                                                                       "Seine Net"= 5), 
                                                                       selected = 1),
                                                           tags$h5("Illustration:"),
                                                           imageOutput("gear_pic"),
                                                           offset=2)
                                           ),
                                           tabPanel("Vessel Nationalities",value = "D",
                                                    p(), htmlOutput("intro_tabset4b")),
                                           tabPanel("Fish Ageing",value = "E",
                                                    p(), htmlOutput("intro_tabset5"),
                                                    p(),
                                                    fluidRow(column(6,
                                                                    imageOutput("tabpic5"),
                                                                    offset=2)),
                                                    fluidRow(column(12,htmlOutput("intro_tabset5b"),style = "margin-top:-8em")))
                               )#close tabsetPanel     
                        ), #close column
                        column(width = 6,
                               conditionalPanel(condition = "input.tabs == 'A'",
                                                #imageOutput("fgmap1",height ="100%"),
                                                leafletOutput("intromap1")),
                               conditionalPanel(condition = "input.tabs == 'B'",
                                                imageOutput("fgmap2",height ="100%"),
                                                htmlOutput("intro_tabsetmap2")),
                               conditionalPanel(condition = "input.tabs == 'C'",
                                                imageOutput("fgmap3"),
                                                #leafletOutput("intromap"),
                                                br(),
                                                br(),
                                                br(),
                                                br(),
                                                br(),
                                                br(),
                                                br(),
                                                br(),
                                                htmlOutput("intro_b1a")),
                               conditionalPanel(condition = "input.tabs == 'D'",
                                                imageOutput("fgmap4"),
                                                br(),
                                                br(),
                                                br(),
                                                br(),
                                                br(),
                                                br(),
                                                htmlOutput("intro_tabset4a")),     
                               conditionalPanel(condition = "input.tabs == 'E'",
                                                imageOutput("fgmap5"))
                        )#close column
                      ) #close fluidRow1 
             ), #close tabPanel 
             #fluidRow(
             #column(3,HTML('<footer>
             #<img src="Irelands_EU_ESIF_2014_2020_en.jpg", width = "300px", height = "100px",style="margin-top: 25em; margin-left: 5px; margin-right: 5px;"</img> 
             #   </footer>')),
             #column(3,img(src="dafm LogoArtboard 1@2x.png", width = "300px", height = "100px",style="margin-top: 2em;")),
             #column(3,img(src="EU logo with text.jpg", width = "280px", height = "170px",style="margin-left: -15px;")),
             #column(3,img(src="Marine_logo_rgb.jpg", width = "320px", height = "90px",style="margin-left: -30px;margin-top: 2em;"))),
             # HTML('<footer>
             #<img src="Niamh.png", width = "1250px", height = "100px", style="display: block; margin-left:-10em; margin-right: auto;margin-top:0em"</img> 
             # </footer>')),  
             
             
             ##### Fish sp tab - option selectors ######  
             tabPanel("Fish Species",
                      fluidRow(
                        column(width = 7,
                               fluidRow(
                                 column(width=3,
                                        selectInput("species",label="Species",
                                                    choices= list("Cod","Boarfish","Haddock","Herring",
                                                                  "Hake","Horse Mackerel","Ling","Mackerel",
                                                                  "Megrim","White-bellied Anglerfish",
                                                                  "Black-bellied Anglerfish","Plaice", "Sole","Sprat",
                                                                  "Blue Whiting","Whiting","Saithe","Pollack"),#"All species",, "Scallop", "Nephrops"
                                                    selected= "Cod" ),
                                        conditionalPanel(condition = "input.fishtab == 'A'",
                                                         selectInput(inputId="biooptionselection", label="Select parameter", 
                                                                     choices=list("None","Age","Sex","Presentation","Gear","Sample Type"),
                                                                     selected = "None")),
                                        conditionalPanel(condition = "input.fishtab == 'B'",
                                                         selectInput(inputId="ageoptionselection", label="Select parameter", 
                                                                     choices=list("None","Sex","Presentation","Gear","Sample Type"),
                                                                     selected = "None")),
                                        conditionalPanel(condition = "input.biooptionselection =='Gear' && input.fishtab == 'A'",
                                                         uiOutput("GearFilter")),
                                        conditionalPanel(condition = "input.ageoptionselection =='Gear' && input.fishtab == 'B'",
                                                         uiOutput("GearFilter.a")                
                                        )),
                                 column(width=4,
                                        conditionalPanel(condition="input.fishtab == 'A'",
                                                         uiOutput("quarterfilter"),
                                                         uiOutput("yearfilter")),
                                        conditionalPanel(condition="input.fishtab == 'B'",
                                                         uiOutput("quarterfilter.a"),
                                                         uiOutput("yearfilter.a"))#,
                                        
                                 ),
                                 column(width=3,
                                        conditionalPanel("input.fishtab == 'A'",
                                                         uiOutput("spatialops.w")), #- SubArea filter
                                        conditionalPanel("input.fishtab == 'A'",
                                                         downloadButton("downloadDatalw", "Download data"),
                                                         br(),
                                                         downloadLink("downloadDatalw_full", "Download full dataset")
                                        ),
                                        conditionalPanel("input.fishtab == 'B'",
                                                         uiOutput("spatialops.a")), #- SubArea filter
                                        conditionalPanel("input.fishtab == 'B'",                 
                                                         downloadButton("downloadDatala", "Download data",class="btn btn-outline-primary"),
                                                         br(),
                                                         downloadLink("downloadDatala_full", "Download full dataset")))#,
                               ),
                               ##### Fish sp tab - Maps and plots  ######                                     
                               fluidRow(
                                 column(width=12,
                                        #GEN
                                        conditionalPanel(condition = "input.fishtab == 'A'",
                                                         plotlyOutput("bio_lw")
                                                         %>% withSpinner(color="#0dc5c1")),
                                        conditionalPanel(condition = "input.fishtab == 'B'",
                                                         plotlyOutput("bio_la")
                                                         %>% withSpinner(color="#0dc5c1"))
                                 )),
                               
                               fluidRow(
                                 column(width=10, 
                                        conditionalPanel(condition = "input.fishtab == 'C'",
                                                         imageOutput("fish_b1", height="100%"),#HTML("<br><br><br><br><br>"),
                                                         tags$style(HTML(".js-irs-0 .irs-grid-pol.small {height: 4px;}")),
                                                         tags$style(HTML(".js-irs-1 .irs-grid-pol.small {height: 0px;}")),
                                                         sliderInput("slideryear", "Choose Year:",
                                                                     min = 2007, max = 2016,
                                                                     value = 2016, step = 1,
                                                                     sep = "",
                                                                     animate = TRUE)),offset=4,style = "margin-top:-5em"))
                               
                        ),#column 
                        ##### Fish sp tab - Species tabsets #####
                        column(width = 5,
                               tabsetPanel(id = "fishtab",
                                           tabPanel("Biology",value= "A", 
                                                    p(), htmlOutput("fish_biology"),
                                                    fluidRow(column(width=7,imageOutput("fish_drawing", height='100%')),
                                                             column(width=5,conditionalPanel(condition = "input.species =='White-bellied Anglerfish' || input.species =='Black-bellied Anglerfish'",
                                                                                             imageOutput("monk_belly"))))),     
                                           tabPanel("Age", value = "B", 
                                                    p(),
                                                    fluidRow(column(width=5, htmlOutput("ageingtxt")),
                                                             column(width=7, imageOutput("speciesotolith", height='100%'))),
                                                    p(),
                                                    fluidRow(column(width=5,textInput("lengthcm", label = "Enter fish length in cm:"), value = 0),
                                                             column(width=7,tags$b("Age range observed*:"), h4(textOutput("agerange")),
                                                                    tags$b("Modal age is:"),h4(textOutput("mode")),
                                                                    tags$small("*age range based on age readings and lengths taken from fish sampled at ports and the stockbook"))),
                                                    hr(),
                                                    column(width=5,actionButton("showhist",label = "Show Histogram")), 
                                                    plotOutput("age_hist")
                                           ),
                                           tabPanel("Distribution",value= "C",
                                                    p(),htmlOutput("fish_distribution"),
                                                    p(),htmlOutput("fish_b1a"),
                                                    h3("Useful links for more information:"),
                                                    a(href=paste0("https://shiny.marine.ie/stockbook/"),
                                                      "The Digital Stockbook",target="_blank"),
                                                    p(),
                                                    a(href=paste0("https://www.marine.ie"),
                                                      "The Marine Institute webpage",target="_blank"))
                               )#close tabsetPanel
                        )#close column
                      )#close fluidRow   
             ) #close tabPanel
  )#close navbarPage
) #close shinyUI






