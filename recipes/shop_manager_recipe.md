# {{PROBLEM}} Multi-Class Planned Design Recipe

## 1. Describe the Problem

As a shop manager
So I can know which items I have in stock
I want to keep a list of my shop items with their name and unit price.

As a shop manager
So I can know which items I have in stock
I want to know which quantity (a number) I have for each item.

As a shop manager
So I can manage items
I want to be able to create a new item.

As a shop manager
So I can know which orders were made
I want to keep a list of orders with their customer name.

As a shop manager
So I can know which orders were made
I want to assign each order to their corresponding item.

As a shop manager
So I can know which orders were made
I want to know on which date an order was placed. 

As a shop manager
So I can manage orders
I want to be able to create a new order.

## 2. Design the Class System

```ruby
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
end

class ItemManager
    def initialize
        @items = [] # needs to be in hash array format
        # @items = [
        #     {name: 'name', price: 'price', quantity: 'quantity'},
        # ]
    end

    def list_items
        # return @items
        # returns an array list of the items
        # return: name and price
    end

    def create_item
        # adds a new item to the @items hash array
        # need to add in price, name, quantity
        # this will be based on user input on a loop
        # returns confirmation that the item is added
        # somehow this links back to the table in the database storing the items
    end
end

class OrderManager
    def initialize
        @orders = [] # hash array format
    end

    def list_orders
        # returns orders with customer name, date, items
    end

    def create_order
        # this needs to ask for the customer_name, items, quantity, return the date
        # require Date in this file
        # this needs to link to the items table to choose items to order
        # need to push the completed order to the orders array
        # orders array needs to connct to orders_table
    end
end

```

## 3. Create Examples as Integration Tests

```ruby

# Shop Manager
# 1 - Lists items from shop 

# Require all the relevant files
io = double :io
order_manager = double :order_manager
item_manager = double :item_manager

expect(io).to receive(:puts).with("Welcome to the shop management program!")
expect(io).to receive(:puts).with("What do you want to do (choose a number)\n1 = list all the shop items\n2 = create a new item\n3 = list all orders\n4 = create a new order")
expect(io).to receive(:gets).and_return("1")
expect(io).to receive(:puts).with("Here is a list of all the shop items: ")
expect(io).to receive(:puts).with("# 1 - Coffee Machine - Unit Price 200 - Quantity 99")

shop_manager = ShopManager.new(io, order_manager, item_manager)
shop.manager.list_functions
shop.manager.list_all_items

```

## 4. Create Examples as Unit Tests

```ruby


```