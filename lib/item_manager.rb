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