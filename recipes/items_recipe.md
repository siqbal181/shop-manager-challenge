## 2. Create Test SQL seeds

DONE

## 3. Define the class names

## 4. Implement the Model class

```ruby
# Table name: items
# (in lib/item.rb)

class Item

  # Replace the attributes by your own columns.
  attr_accessor :id, :name, :price, :quantity
end
```
## 5. Define the Repository Class interface

```ruby
# Table name: items
# (in lib/item_manager.rb)

class ItemManager

  def all
    # Executes the SQL query:
    # SELECT id, name, cohort_name FROM students;

    # Returns an array of Student objects.
  end

  # Gets a single record by its ID
  # One argument: the id (number)
  def find(id)
    # Executes the SQL query:
    # SELECT id, name, cohort_name FROM students WHERE id = $1;

    # Returns a single Student object.
  end
end
```

## 6. Write Test Examples

```ruby
# EXAMPLES

# 1
# Returns a list of items from the shop

item_manager = ItemManager.new
items = item_manager.list_items
expect(items.length).to eq(5)
expect(items.first.name).to eq('Coffee Machine')

# 2
# Creates a new item 
item_manager = ItemManager.new
item_manager.create_item



```

## 7. Reload the SQL seeds before each test run

```ruby
# EXAMPLE

# file: spec/item_manager_spec.rb

def reset_seeds_table
    seed_sql = File.read('spec/seeds.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'shop_manager_test' })
    connection.exec(seed_sql)
  end

  before(:each) do 
    reset_seeds_table
  end

```