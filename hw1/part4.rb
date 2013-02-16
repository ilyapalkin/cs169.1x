# Done
class Dessert
  def initialize(name, calories)
    # YOUR CODE HERE
	@name, @calories = name, calories
  end
  
  attr_accessor :name
  attr_accessor :calories
  
  def healthy?
    # YOUR CODE HERE
	@calories < 200
  end
  
  def delicious?
    # YOUR CODE HERE
	true
  end
end

# Done
class JellyBean < Dessert
  def initialize(name, calories, flavor)
    # YOUR CODE HERE
	super(name, calories)
    @flavor = flavor
  end
  
  attr_accessor :flavor
  
  def delicious?
    # YOUR CODE HERE
	if @flavor == "black licorice" 
		false 
	else 
		super 
	end
  end
end
