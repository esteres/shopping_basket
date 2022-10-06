require_relative 'product'
require_relative 'product_list_composite'

class Client

  def initialize
    @product_list_composite = ProductListComposite.new
  end

  def inputs
    print 'Enter product name: '
    @name = gets.chomp
    print 'Enter product price: '
    @price = gets.chomp.to_f
    print 'Enter product quantity: '
    @quantity = gets.chomp.to_i

    add_product_to_list
  end

  def add_product_to_list
    @quantity.times do
      @product_list_composite.append(Product.new(@name, @price)) 
    end
  end

  def receipt
    puts 'Receipt:'
    puts  @product_list_composite.to_s
    puts "Sales Taxes: %0.2f" % [@product_list_composite.tax] 
    puts "Total: %0.2f" % [@product_list_composite.total]
  end
end

client = Client.new

puts '############################################################'
puts "\n\nLet's fill the shopping cart with some products \n\n"

puts 'Please select which action you want to perform:'
puts '1. Add a product'
puts '2. Generate receipt'
puts '3. Exit'
puts "\n\n############################################################"

while true
  print 'Enter your choice: '
  choice = gets.chomp.to_i

  case choice
  when 1
    client.inputs
  when 2
    client.receipt
  when 3
    break
  end
end
