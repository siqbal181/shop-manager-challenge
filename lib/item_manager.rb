require_relative './item'

class ItemManager
  def initialize
    @items = []
  end

  def list_items
    sql = 'SELECT id, name, price, quantity FROM items;'
    sql_params = []
    items_result_set = DatabaseConnection.exec_params(sql, sql_params)

    items_result_set.each do |row|
      item = Item.new
      item.id = row['id']
      item.name = row['name']
      item.price = row['price']
      item.quantity = row['quantity']

      @items << item
    end
    return @items
  end
  
    def create_item(item)
      sql = 'INSERT INTO items (name, price, quantity) VALUES($1, $2, $3)'
      sql_params = [item.name, item.price, item.quantity]
      items_result_set = DatabaseConnection.exec_params(sql, sql_params)
  
      return nil
    end
  end
