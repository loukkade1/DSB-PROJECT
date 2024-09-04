#options
pizzas <- c("Margherita", "Pepperoni", "Hawaiian")
sizes <- c("Small", "Medium", "Large")
toppings <- c("Extra Cheese", "Mushrooms", "Onions", "Peppers")

#prices
price_list <- list(
  "Margherita" = 8,
  "Pepperoni" = 10,
  "Hawaiian" = 12,
  "Small" = 1,
  "Medium" = 2,
  "Large" = 3,
  "Extra Cheese" = 1,
  "Mushrooms" = 1,
  "Onions" = 1,
  "Peppers" = 1
)

#Function to display the menu
show_menu <- function(){
  cat("Welcome to the Pizzeria\n")
  cat("Here are the available pizza:\n")
  print(pizzas)
}


#Function to take an order
take_order <- function(){
  show_menu()
  pizza_choice <- readline("Which pizza would you like to order? ")
  
  #Display the size options
  cat("Here are available sizes:\n")
  print(sizes)
  size_choice <- readline("What size would you like? ")
  
  #Display the topping options
  cat("Here are topping options:\n")
  print(toppings)
  topping_choice <- readline("Any additional toppings? (Separate by comma) ")
  
  #Splitting the toppings input into a vector
  topping_list <- unlist(strsplit(topping_choice, ","))
  
  #Order summary
  cat("You have ordered a ",size_choice, pizza_choice,"pizza with", topping_list,"\n")
  
  #calculating total cost
  total_cost <- price_list[[pizza_choice]]+price_list[[size_choice]]
  for (topping in topping_list){
    total_cost <- total_cost + price_list[[topping]]
  }
  cat("The total cost is $", total_cost)
}

#Using the function to take an order
take_order()
