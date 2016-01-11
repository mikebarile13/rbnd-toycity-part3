class Transaction
	 attr_reader :customer, :product, :id

    @@transactions = []
    @@max_id = 1

    def initialize(customer, product)
      product.decrease_stock
      @customer = customer
      @product = product
      @id = max_id 
      @@max_id += 1
      add_to_transactions
    end

    #Returns an array of all Toy City transactions
    def self.all
      @@transactions
  	end

    # Returns a single transaction based on id paramater
    def self.find(id)
      searched_id = @@transactions.find{|transaction| transaction.id == id}
      if searched_id = null
        raise MissingTransactionError, "Transaction '#{id}' is not in our records."
      else 
        searched_id
      end 
    end 

  	private

    #Adds the transaction to an array with a list of all transactions
  	def add_to_transactions
    	@@transactions << self
  	end
end