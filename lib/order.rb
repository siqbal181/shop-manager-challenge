class Order
  # Replace the attributes by your own columns.
  attr_accessor :id, :customer_name, :item_id, :date

  def initialize(id, customer_name, item_id, date)
    @id = id
    @customer_name = customer_name
    @item_id = item_id
    @date = date
  end
end
  