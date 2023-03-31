require_relative './order'

class OrderManager
  def initialize
    @orders = [] # hash array format
  end

  def list_orders
    sql = 'SELECT id, customer_name, item_id, date FROM orders;'
    sql_params = []
    order_result_set = DatabaseConnection.exec_params(sql, sql_params)

    order_result_set.each do |row|
      order = Order.new
      order.id = row['id']
      order.customer_name = row['customer_name']
      order.item_id = row['item_id']
      order.date = row['date']

      @orders << order
    end
    return @orders
  end

  def create_order(order)
    sql = 'INSERT INTO orders (customer_name, item_id, date) VALUES ($1, $2, $3)'
    sql_params = [order.customer_name, order.item_id, order.date]

    order_result_set = DatabaseConnection.exec_params(sql, sql_params)

    return nil
  end
end
