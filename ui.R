# Load libraries, data -----------------------------------------------
characters <- read.csv("data/mariokart_characters.csv")


# Page 1 - Introduction ----------------------------------------------
intro_panel <- tabPanel(
  "Introduction",
  
  titlePanel("Characteristics of Mario Kart Drivers"),
  
  img(src = "www/mariokart.jpg", width = 800, height = 400),
  br(), br(),
  
  p("This is a 2-page shiny application using Mario Kart 8 character data. The application consists of an introduction page and a visualization page. The visualization page includes an interactive vertical bar chart where the user can select which variables they would like to compare each Mario Kart Character."),
  
  p(a(href = "https://www.kaggle.com/barelydedicated/mariokart8?select=characters.csv", "Data Source (Kaggle)"))
)

# Page 2 - Character Visualization -------------------------------------------
select_values <- colnames(characters)
select_values <- select_values[! select_values %in% c('Character', 'Class')] # remove unwanted columns

sidebar_content <- sidebarPanel(
  selectInput(
    "y_var",
    label = "Y Variable",
    choices = select_values,
    selected = 'Speed'
  )
)

main_content <- mainPanel(
  plotOutput("plot")
)

second_panel <- tabPanel(
  "Visualization",
  titlePanel("What are the Characteristics of each Mario Kart 8 Driver?"),
  p("Use the selector input below to choose which variable you would like to see."),
  sidebarLayout(
    sidebar_content, main_content
  )
)

# User Interface -----------------------------------------------------
ui <- navbarPage(
  "Mario Kart Characteristics",
  intro_panel,
  second_panel
)