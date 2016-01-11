class Product
	attr_reader :title, :price, :stock

	@@products = []

	def initialize(options={})
    	@title = options[:title]
    	@price = options[:price]
    	@stock = options[:stock]
    	add_to_products
	end

  	#Returns true if the product is in stock i.e. stock > 0
  	def instock?
  		if stock > 0 
  			return TRUE
  		else return FALSE 
  	end

  	def self.all
    	@@products
  	end

  	#Returns a single product based on its title
  	def self.find_by_title(title)
  		#FILL THIS IN
  	end

  	#Returns an array with all in-stock products
  	def self.in_stock
  		#FILL THIS IN
  	end

  	private

  	def add_to_products
    	@@products << self
  	end
end