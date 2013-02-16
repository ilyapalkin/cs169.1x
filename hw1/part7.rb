class CartesianProduct
  include Enumerable
  # YOUR CODE HERE
  
  def initialize(a, b)
    @a, @b = a, b
  end

  def each
    @a.each do |ai|
      @b.each do |bj|
        yield [ai,bj]
      end
    end
  end
end

# #specs
# On Time 
# CartesianProduct
  # should work for the first example given in the homework [15 points]
  # should work for the second example given in the homework [10 points]
  # should return nothing for the case where both of them are empty [15 points]
  # should work for other examples for 2x2 [20 points]
  # should work for 3x3 and 4x4 [40 points]

# Finished in 0.00309 seconds
# 5 examples, 0 failures
