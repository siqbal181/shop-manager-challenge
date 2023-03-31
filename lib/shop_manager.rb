class ShopManager
    def initialize(io, items, orders)
        @items = items
        @orders = orders
        @io = io
    end


    def list_functions
        loop do
            puts "Welcome to the shop management program!"
            puts "What do you want to do (choose a number)
            \n1 = list all the shop items
            \n2 = create a new item
            \n3 = list all orders
            \n4 = create a new order"
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