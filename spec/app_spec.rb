# require "./app"
# require "./item_manager"
# require "./item"
# require "./order_manager"
# require "./order"

# RSpec.describe ShopManager do
#   def reset_seeds_table
#     seed_sql = File.read('spec/seeds.sql')
#     connection = PG.connect({ host: '127.0.0.1', dbname: 'shop_manager_test' })
#     connection.exec(seed_sql)
#   end
    
#   before(:each) do 
#     reset_seeds_table
#   end

#   it "returns a list of shop items upon user entering 1" do
#   end
# end
