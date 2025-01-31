require "item_manager"

RSpec.describe ItemManager do
  def reset_seeds_table
    seed_sql = File.read('spec/seeds.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'shop_manager_test' })
    connection.exec(seed_sql)
  end
    
  before(:each) do 
    reset_seeds_table
  end

  it "returns a list of all items from the shop" do
    item_manager = ItemManager.new
    items = item_manager.list_items
    expect(items.length).to eq(5)
    expect(items.first.name).to eq('Coffee Machine')
  end

  it "creates a new item for the shop" do
    item_manager = ItemManager.new
    item = Item.new(6, 'Headphones', '150', '20')
    item_manager.create_item(item)
    items = item_manager.list_items
    expect(items.length).to eq(6)
    expect(items.last.name).to eq('Headphones')
  end
end
