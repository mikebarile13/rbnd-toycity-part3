class Transaction
	 attr_reader :customer, :product, :id

    @@transactions = []
    @@max_id = 1

    def initialize(customer, product)
      @customer = customer
      @product = product
      product.decrease_stock
      @id = max_id 
      @@max_id += 1
      add_to_transactions
    end

    #Returns an array of all Toy City transactions
    def self.all
      @@transactions
  	end

  	#Returns a single product based on its title
  	def self.find_by_name(name)
  		#FILL THIS IN
  	end

  	private

    #Adds the transaction to an array with a list of all transactions
  	def add_to_transactions
    	@@transactions << self
  	end
end