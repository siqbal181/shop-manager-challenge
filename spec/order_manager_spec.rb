require "order_manager"

RSpec.describe OrderManager do
  def reset_seeds_table
    seed_sql = File.read('spec/seeds.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'shop_manager_test' })
    connection.exec(seed_sql)
  end
        
  before(:each) do 
    reset_seeds_table
  end

  it "returns a list of all the orders" do
    order_manager = OrderManager.new
    order_list = order_manager.list_orders
    expect(order_list.length).to eq(6)
    expect(order_list.first.customer_name).to eq('Karen')
  end

  it "creates a new order" do
    order_manager = OrderManager.new
    order = Order.new
    order.customer_name = 'Sidra'
    order.item_id = '2'
    order.date = '2023-03-31'
    order_manager.create_order(order)
    list_of_orders = order_manager.list_orders

    expect(list_of_orders.length).to eq(7)
    expect(list_of_orders.last.customer_name).to eq('Sidra')
  end
end
