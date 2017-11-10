# Jace P. Gold
# November 9th, 2017

# To Do
# - User chooses from a list of main dishes - Done
# - The user chooses 2 side dish items - Done
# - The computer repeats users order - Done
# - Display total - Done

# Bonus
# - the user can choose as many "add-on" items as they want before getting total - Done
# - the user can clear their choices and start over - Done
# - the user has a wallet total they start with and their choices cannot exceed what they can pay for
# - the program is in a loop to keep asking the user to make new orders until they type 'quit' at any time
# - main dishes and side items have descriptions with them and the user has an option to view the description /nutritional facts before they order (hint: think hashes)
# - descriptions of food can have multiple options like nutritional facts, calories, fat content ect...(hint: think nested hashes)
# - display to the user not only their total but the total fat content/calories / carbs / etc...
#require_relative 'menu_item'

# Completed
# - User chooses from a list of main dishes
# - The user chooses 2 side dish items
# - The computer repeats users order
# - Display total
# Bonus
# - the user can choose as many "add-on" items as they want before getting total
# - the user can clear their choices and start over

# Working on: changing 'quit' from quitting in the menu method to quitting whenever
# the user types quit


require 'pry'
require 'colorize'
require_relative 'create_item'

# Start menu items
# Entrees
@entrees = [
  {name: 'Cheeseburger', calories: 600, price: 8.00},
  {name: 'Pizza', calories: 650, price: 8.00},
  {name: 'Taco', calories: 350, price: 8.00}
]

# Sides
@sides = [
  {name: 'French Fries', calories: 200, price: 1.00},
  {name: 'Salad', calories: 150, price: 2.50},
  {name: 'Garlic Bread', calories: 300, price: 4.50}
]
# Drinks
@drinks = [
  {name: 'Lemonade', calories: 120, price: 3.39},
  {name: 'Coke', calories: 120, price: 1.00},
  {name: 'Water', calories: 5, price: 0.00}
]

# End menu items

# Start definitions
def entree
  puts "\t------ What would you like to eat? ------\n\n"
  count = 0
  while count < @entrees.length do
    print "#{count + 1}".ljust(10) # Plus 1 so list doesn't start at 0 when displayed
    print "#{@entrees[count][:name]}".ljust(20).colorize(:light_blue)
    print "Calories: #{@entrees[count][:calories]}".ljust(20).colorize(:yellow)
    print "$#{@entrees[count][:price]}".ljust(20).colorize(:green)
    puts "\n\n"
    count += 1
  end
  puts "\t\tWhat would you like to add?"
  print '> '
  selection = $stdin.gets.strip.to_i
  selection -= 1
  # Check to see if item exists or user entered valid input
  selection = @entrees[selection]
  return selection
end

def sides
  puts "\t------ What would you like as a side? ------\n\n"
  count = 0
  while count < @sides.length do
    print "#{count + 1}".ljust(10) # Plus 1 so list doesn't start at 0 when displayed
    print "#{@sides[count][:name]}".ljust(20).colorize(:light_blue)
    print "Calories: #{@sides[count][:calories]}".ljust(20).colorize(:yellow)
    print "$#{@sides[count][:price]}".ljust(20).colorize(:green)
    puts "\n\n"
    count += 1
  end
  puts "\t\tWhat would you like to add?"
  print '> '
  selection = $stdin.gets.strip.to_i
  selection -= 1
  selection = @sides[selection]
  return selection
end

def drink
  puts "\t------ What would you like to drink? ------\n\n"
  count = 0
  while count < @drinks.length do
    print "#{count + 1}".ljust(10) # Plus 1 so list doesn't start at 0 when displayed
    print "#{@drinks[count][:name]}".ljust(20).colorize(:light_blue)
    print "Calories: #{@drinks[count][:calories]}".ljust(20).colorize(:yellow)
    print "$#{@drinks[count][:price]}".ljust(20).colorize(:green)
    puts "\n\n"
    count += 1
  end
  puts "\t\tWhat would you like to add?"
  print '> '
  selection = $stdin.gets.strip.to_i
  selection -= 1
  selection = @drinks[selection]
  return selection
end

def view_order
  @tray.Display
end
# End definitions

# Start Main
def options
  @tray.add_to_cart(entree)
  @tray.add_to_cart(sides)
  @tray.add_to_cart(drink)
  view_order
end

def menu
  system('clear')
  @tray = Tray.new([], 0, 0)
    puts '----- Lunch -----'
    options
    puts "\n\n1. ) 'More' to continue adding items".colorize(:green)
    puts "2.) 'Clear' to clear start over".colorize(:red)
    puts "3.) 'Done' to check out...".colorize(:blue)
    print '> '
    choice = $stdin.gets.strip.downcase
    if choice.include?('more') || choice.include?('1')
      options
    elsif choice.include?('clear') || choice.include?('2')
      menu
    elsif choice.include?('Done') || choice.include?('3')
      puts "Thanks for eating with us!"
      exit 0
    end
  end

menu
