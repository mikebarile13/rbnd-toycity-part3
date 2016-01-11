class Customer
	 attr_reader :name

    @@customers = []

    def initialize(name)
      @name = name
      add_to_customers
    end

    def self.all
      @@products
  	end

  	#Returns a single product based on its title
  	def self.find_by_name(name)
  		#FILL THIS IN
  	end

  	private

  	def add_to_customers
    	@@customers << self
  	end
end