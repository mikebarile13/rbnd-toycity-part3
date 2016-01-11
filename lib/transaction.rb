class Transaction
	 attr_reader :customer, :product, :id

    @@transactions = []
    @@max_id = 1

    def initialize(options={})
      product.decrease_stock
      @customer = options[:customer]
      @product = options[:product]
      @id = @@max_id 
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
    end 

  	private

    #Adds the transaction to an array with a list of all transactions
  	def add_to_transactions
    	@@transactions << self
  	end
end