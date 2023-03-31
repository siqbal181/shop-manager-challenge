class ShopManager
  def initialize
    @items = []
    @orders = []
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
        list_items
      when "2"
        create_item
      when "3"
        list_orders
      when "4"
        create_order
      end
    end
  end
  
  def list_items
    return "placeholder_list"
  end

  def create_item
    return "placeholder_create"
  end

  def list_orders
    return "placeholder_list_orders"
  end

  def create_order
    return "placeholder_create_order"
  end
end

shop_manager = ShopManager.new
shop_manager.list_functions
  