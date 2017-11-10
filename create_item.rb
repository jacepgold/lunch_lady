# create_item.rb

class Tray #Items on the tray
  attr_accessor :items, :calories, :price

  def initialize(items, calories, price)
    @items = items
    @calories = calories
    @price = price
  end

  def Display
    puts "\t----- You currently have -----\n\n"
    count = 1
    @items.each do |i|
      print "#{count} -".ljust(10)
      print "#{i[:name]}".ljust(20).colorize(:light_blue)
      print "Calories #{@calories}".ljust(20).colorize(:yellow)
      print "Price #{@price}".ljust(20).colorize(:green)
      puts "\n\n"
      count += 1
    end
    puts "Total Items #{@items.length}".colorize(:light_blue)
    puts "Calories: #{@calories}".ljust(20).colorize(:yellow)
    puts "Total: #{@price}".ljust(20).colorize(:green)
  end

  def remove
    # Remove an item
  end

  def update_quantity
    # Change how many of given item
  end

  def add_to_cart(item)
    @items << item
    @price += item[:price]
    @calories += item[:calories]
  end
end

class Entree

end

class Sides

end

class Drink

end
