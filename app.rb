require_relative 'lib/database_connection'
require_relative 'lib/item_manager'
require_relative 'lib/order_manager'

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
        puts "This is 1"
      when "2"
        puts "This is 2"
      when "3"
        puts "This is 3"
      when "4"
        puts "This is 4"
      end
    break
    end
  end
end
