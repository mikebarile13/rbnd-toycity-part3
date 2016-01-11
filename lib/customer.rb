class Customer
	 attr_reader :name, :purchases

    @@customers = []

    def initialize(options={})
        @name = options[:name]
        @purchases = []
        if Customer.customer_exists?(@name)
            raise DuplicateCustomerError, "'#{@name}' already exists"
        else
            add_to_customers
        end
    end

    # Allows a customer to "purchase" a product; generates a new transaction and adds the purchase to the customer's purchase history array
    def purchase(product)
        transaction = Transaction.new(self, product)
        @purchases << transaction
    end

    def get_purchases
        @purchases
    end

    # Returns an array with all customers
    def self.all
        @@customers
  	end

  	# Returns a single customer based on customer name
  	def self.find_by_name(name)
        searched_name = @@customers.find{|customer| customer.name == name}
    end

    # Checks to see if a customer is already in the database
    def self.customer_exists?(name)
        exists = false
        @@customers.each{|customer| if customer.name == name then exists = true end}
        exists
    end

  	private

    # Adds to an array with a list of all customers
  	def add_to_customers
    	  @@customers << self
  	end
end