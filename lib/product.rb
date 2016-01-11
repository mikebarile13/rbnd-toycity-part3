class Product
	attr_reader :title, :price, :stock

	@@products = []

	def initialize(options={})
    	@title = options[:title]
    	@price = options[:price]
    	@stock = options[:stock]
    	if Product.product_exists?(@title)
    		raise DuplicateProductError, "'#{@title}' already exists"
    	else
    		add_to_products
    	end
	end

  	# Returns true if the product is in stock i.e. stock > 0
  	def in_stock?
  		if stock > 0 
  			TRUE
  		else 
  			FALSE 
  		end
  	end

  	# Decreases a product's stock. Passes an error if stock = 0. 
  	def decrease_stock
  		if @stock > 0
  			then @stock -= 1
  		else 
  			raise OutOfStockError, "'#{@title}' is out of stock."
  		end
  	end

  	# Returns an array including all products
  	def self.all
    	@@products
  	end

  	# Returns a single product based on its title
  	def self.find_by_title(title)
  		searched_product = @@products.find{|product| product.title == title}
  	end

  	# Returns a single product based on its title
  	def self.product_exists?(title)
  		exists = false
  		@@products.each{|product| if product.title == title then exists = true end}
  		exists
  	end

  	# Returns an array with all in-stock products
  	def self.in_stock
  		in_stock = []
  		in_stock = @@products.reject{|product| product.stock < 1}
  	end

  	private

  	# Adds to an array with a list of all products
  	def add_to_products
    	@@products << self
  	end
end