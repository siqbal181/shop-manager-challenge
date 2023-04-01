require_relative 'lib/database_connection'
require_relative 'lib/item_manager'
require_relative 'lib/order_manager'

DatabaseConnection.connect('shop_manager')

class ShopManager
  def initialize(order_manager, item_manager)
    @order_manager = order_manager
    @item_manager = item_manager
  end

  def list_functions
    loop do
      puts "Welcome to the shop management program!"
      puts "What do you want to do (choose a number)
        1 = list all the shop items
        2 = create a new item
        3 = list all orders
        4 = create a new order"
      choice = gets.chomp
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
      break
    end
  end

  def list_all_items
    puts "Here is a list of all shop items: "
    @item_manager.list_items.each_with_index do |item, index|
      puts "##{index+1} #{item.name} - Unit Price: #{item.price} - Quantity #{item.quantity}"
    end
  end

  def create_item
    puts "Please enter the name of the new item: "
    name = gets.chomp
    puts "Enter the price of #{name}: "
    price = gets.chomp.to_i
    puts "Enter the quantity of #{name}: "
    quantity = gets.chomp.to_i
    item = Item.new
    item.name = name
    item.price = price
    item.quantity = quantity
    @item_manager.create_item(item)

    puts "#{name} has been added to the shop!"
  end

  def list_orders
    puts "Here is a list of orders: "
    @order_manager.list_orders.each_with_index do |order, index|
      puts "##{index+1} Customer Name: #{order.customer_name} - Item_ID: #{order.item_id} - Date #{order.date}"
    end
  end

  def create_order
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

order_manager = OrderManager.new
item_manager = ItemManager.new
shop_manager = ShopManager.new(order_manager, item_manager)
shop_manager.list_functions
