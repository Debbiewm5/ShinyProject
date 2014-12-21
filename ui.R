library(shiny)

shinyUI(
  navbarPage("Developing Data Products - Course Project",
             tabPanel("Fuel Efficiency Study",
                      fixedPage(
                        titlePanel("Relationship fuel efficiency and selected variable"),
                        sidebarLayout(
                          sidebarPanel(
                            selectInput("variable", "Variable:",
                                        c("Number of cylinders" = "cyl",
                                          "Displacement (cu.in.)" = "disp",
                                          "Gross horsepower" = "hp",
                                          "Rear axle ratio" = "drat",
                                          "Weight (lb/1000)" = "wt",
                                          "1/4 mile time" = "qsec",
                                          "V/S" = "vs",
                                          "Transmission" = "am",
                                          "Number of forward gears" = "gear",
                                          "Number of carburetors" = "carb"
                                        )),
                            
                            checkboxInput("outliers", "Include outliers", FALSE)
                          ),
                          
                          mainPanel(
                            h3(textOutput("caption")),
                            
                            tabsetPanel(type = "tabs", 
                                        tabPanel("BoxPlot", plotOutput("bplot")),
                                        tabPanel("Linear Regression model", 
                                                 plotOutput("plot"),
                                                 verbatimTextOutput("fit")
                                        )
                            )
                          )
                        )
                      )
             ),
             tabPanel("Help",
                      h4("Motor Trend Car Road Tests"),
                      hr(),
                      h5("Objective"),
                      p("The app aims to present some exploratory analysis of the data. We aim to study the impact of the variables on fuel efficiency as measured in mpg. Towards this end, the app creates box plots for any of the selected independent variables against the dependent variable mpg. It also provides a linear regression model for fuel efficiency (mpg) against the selected variable."),
                      h5("Data"),
                      helpText("The data was extracted from the 1974 Motor Trend US magazine,and comprises fuel consumption and 10 aspects of automobile design and performance for 32 automobiles (1973-74 models)."),
                      p("The data consists of 32 observations on 11 variables explained below."),
                      p(" mpg - Miles/(US) gallon"),
                      p(" cyl - Number of cylinders"),
                      p(" disp - Displacement (cu.in.)"),
                      p(" hp - Gross horsepower"),
                      p(" drat - Rear axle ratio"),
                      p(" wt - Weight (lb/1000)"),
                      p(" qsec - 1/4 mile time"),
                      p(" vs - V/S"),
                      p(" am - Transmission (0 = automatic, 1 = manual)"),
                      p(" gear - Number of forward gears"),
                      p(" carb - Number of carburetors"),
                      hr(),
                      p("Source: Henderson and Velleman (1981), Building multiple regression models interactively. Biometrics, 37, 391-411."),
                      p("Code available at https://github.com/voilamochu/ShinyProject/")
            )
  )
)