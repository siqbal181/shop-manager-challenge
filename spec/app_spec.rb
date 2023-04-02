require "./app"
require "item_manager"
require "item"
require "order_manager"
require "order"

RSpec.describe ShopManager do
  def reset_seeds_table
    seed_sql = File.read('spec/seeds.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'shop_manager_test' })
    connection.exec(seed_sql)
  end
  
  before(:each) do
    reset_seeds_table
  end
  
  it "returns a list of shop items upon user entering 1" do
    io = double :io
    order_manager = double :order_manager
    item_manager = double :item_manager

    expect(io).to receive(:puts).with("Welcome to the shop management program!")
    expect(io).to receive(:puts).with("What do you want to do (choose a number)\n1 = list all the shop items\n2 = create a new item\n3 = list all orders\n4 = create a new order")
    expect(io).to receive(:gets).and_return("1")
    expect(io).to receive(:puts).with("Here is a list of all the shop items: ")

    shop_manager = ShopManager.new(io, order_manager, item_manager)
    allow(item_manager).to receive(:list_items).and_return([Item.new('1', "Coffee Machine", 200, 99)])

    expect(io).to receive(:puts).with("# 1 - Coffee Machine - Unit Price: 200 - Quantity 99")

    shop_manager.list_functions
  end

  it "lists orders based on user entering 3" do
    io = double :io
    order_manager = double :order_manager
    item_manager = double :item_manager

    expect(io).to receive(:puts).with("Welcome to the shop management program!")
    expect(io).to receive(:puts).with("What do you want to do (choose a number)\n1 = list all the shop items\n2 = create a new item\n3 = list all orders\n4 = create a new order")
    expect(io).to receive(:gets).and_return("3")
    expect(io).to receive(:puts).with("Here is a list of orders: ")

    shop_manager = ShopManager.new(io, order_manager, item_manager)
    allow(order_manager).to receive(:list_orders).and_return([Order.new('1', "Karen", "1", "2023-03-31")])

    expect(io).to receive(:puts).with("# 1 - Customer Name: Karen - Item_ID: 1 - Date: 2023-03-31")

    shop_manager.list_functions
  end
end
