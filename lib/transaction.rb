class Transaction
	 attr_reader :customer, :product, :id, :timestamp

    @@transactions = []
    @@max_id = 1

    def initialize(customer, product)
        product.decrease_stock
        @customer = customer
        @product = product
        @id = @@max_id 
        @@max_id += 1
        @timestamp = Time.now
        add_to_transactions
        customer.add_purchase(self)
    end

    #Returns an array of all Toy City transactions
    def self.all
        @@transactions
  	end

    # Returns a single transaction based on id paramater
    def self.find(id)
        searched_id = @@transactions.find{|transaction| transaction.id == id}
    end 

    # Returns the timestamp for the input id
    def self.get_timestamp(id)
        searched_id = @@transactions.find{|transaction| transaction.id == id}
        searched_id.timestamp
    end

  	private

    #Adds the transaction to an array with a list of all transactions
  	def add_to_transactions
    	  @@transactions << self
  	end
end