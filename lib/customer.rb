class Customer
	 attr_reader :name, :purchases

    @@customers = []

    def initialize(name)
      @name = name
      @purchases = []
      add_to_customers
    end

    # Allows a customer to "purchase" a product; generates a new transaction and adds the purchase to the customer's purchase history array
    def purchase(product)
      transaction = Transaction.new(self, product)
      @purchases << transaction
    end

    # Returns an array with all customers
    def self.all
      @@customers
  	end

  	# Returns a single product based on its title
  	def self.find_by_name(name)
      searched_name = @@customers.find{|customer| customer.name == name}
      if searched_name = null
        raise MissingTitleError, "'#{name}' is not the name of a customer."
      else 
        searched_name
      end 
    end

  	private

    # Adds to an array with a list of all customers
  	def add_to_customers
    	@@customers << self
  	end
end