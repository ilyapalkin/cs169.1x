#For those just starting out, one suggested way to work on your code is to have a command window open and a text editor with this
#file loaded.  Make changes to this file and then run 'ruby part1.rb' at the command line, this will run your program.  Once you're
#satisfied with your work, save your file and upload it to the checker.


def palindrome?(str)
  # YOUR CODE HERE
  str = str.downcase().gsub(/[^a-zA-Z]/, "")  
  return str.reverse == str
  ## Done
end

def count_words(str)
  # YOUR CODE HERE
  hash = Hash.new(0)
  str.downcase().scan(/\b\w+\b/).each { |word| hash[word] += 1 }
  return hash
  ## Done
end


#the code below this line will test your functions.  You should remove everything below this line prior to submitting your file


test_str = "there goes the neighborhood"

if palindrome? test_str
  puts test_str + " is a palindrome!"
else
  puts test_str + " is NOT a palindrome!"
end


test_str = "Madam, I'm Adam"

if palindrome? test_str
  puts test_str + " is a palindrome!"
else
  puts test_str + " is NOT a palindrome!"
end


test_str = "The rent is due on the first day of the month unless the first day of the month falls on a Saturday or Sunday"

word_count = count_words test_str
puts word_count

# #spec
# On Time 
# #palindrome?
  # should be defined
  # recognizes palindromes correctly [25 points]
  # recognizes non palindromes correctly [25 points]

# #count_words
  # should be defined
  # should return a Hash
  # counts the words properly [40 points]
  # is not sensitive to case [10 points]

# Finished in 0.01596 seconds
# 7 examples, 0 failures
