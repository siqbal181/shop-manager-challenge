require_relative 'lib/database_connection'
require_relative 'lib/item_manager'
require_relative 'lib/order_manager'

DatabaseConnection.connect('shop_manager')

class ShopManager
  def initialize(io, order_manager, item_manager)
    @io = io
    @order_manager = order_manager
    @item_manager = item_manager
  end

  def list_functions
    @io.puts "Welcome to the shop management program!"
    @io.puts "What do you want to do (choose a number)\n1 = list all the shop items\n2 = create a new item\n3 = list all orders\n4 = create a new order"
    choice = @io.gets.chomp
    case choice
    when "1"
      list_all_items
    when "2"
      create_item
    when "3"
      list_orders
    when "4"
      create_order
    end
  end

  def list_all_items
    @io.puts "Here is a list of all the shop items: "
    items = @item_manager.list_items
    items.each_with_index do |item, index|
      @io.puts "##{index + 1} #{item.name} - Unit Price: #{item.price} - Quantity #{item.quantity}"
    end
  end

  def create_item
    @io.puts "Please enter the name of the new item: "
    name = @io.gets.chomp
    @io.puts "Enter the price of #{name}: "
    price = @io.gets.chomp.to_i
    @io.puts "Enter the quantity of #{name}: "
    quantity = @io.gets.chomp.to_i
    item = Item.new
    item.name = name
    item.price = price
    item.quantity = quantity
    @item_manager.create_item(item)

    @io.puts "#{name} has been added to the shop!"
  end

  def list_orders
    @io.puts "Here is a list of orders: "
    @order_manager.list_orders.each_with_index do |order, index|
      @io.puts "##{index + 1} Customer Name: #{order.customer_name}
      - Item_ID: #{order.item_id} - Date #{order.date}"
    end
  end

  def create_order
    @io.puts "Please enter the customer name of the new order: "
    customer_name = @io.gets.chomp
    @io.puts "Enter the item_id to order: "
    item_id = @io.gets.chomp.to_i
    @io.puts "Enter the date of the order: "
    date = @io.gets.chomp
    order = Order.new
    order.customer_name = customer_name
    order.item_id = item_id
    order.date = date
    @order_manager.create_order(order)

    @io.puts "Your order has been created!"
  end
end

# if __FILE__ == $0
#   app = ShopManager.new(
#     'shop_manager',
#     Kernel,
#     ItemManager.new,
#     OrderManager.new
#   )
#   app.run
# end
