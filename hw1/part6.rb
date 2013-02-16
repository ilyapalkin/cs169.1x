#Done

class Numeric
  @@currencies = {'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019, 'dollar' => 1.000}
  def method_missing(method_id)
    singular_currency = method_id.to_s.gsub( /s$/, '')
    if @@currencies.has_key?(singular_currency)
      self * @@currencies[singular_currency]
    else
      super
    end
  end
  
  def in(currency)
    singular_currency = currency.to_s.gsub(/s$/, '')
    if @@currencies.has_key?(singular_currency)
      self / @@currencies[singular_currency]
    end
  end  
end

class String
  # YOUR CODE HERE
  def palindrome?
	str = self.downcase().gsub(/[^a-zA-Z]/, "")  
	return str.reverse == str
  end
end

module Enumerable
  # YOUR CODE HERE
  def palindrome?()
    len = self.count
    if (len < 2)
      true
    elsif (self.to_a.first == self.to_a.last)
      self.take(len - 1).drop(1).palindrome?
    else
      false
    end
  end
end

#puts "fooF".palindrome?
#puts [1,2,3,4,5,4,3,2,1].palindrome?