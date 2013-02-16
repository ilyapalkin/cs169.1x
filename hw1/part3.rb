def combine_anagrams(words)
 # YOUR CODE HERE
	anagrams = Hash.new
	words.each { |word|	
		key = word.downcase.chars.sort.join
		anagrams[key] ||= []
		anagrams[key] << word
	}
	return anagrams.values
end

# #specs
# On Time 
# anagrams
  # should handle an empty array [2 points]
  # should handle the most simple, single-character case with no repeats [2 points]
  # should handle the most simple, single-character case with capital letters but no repeats [2 points]
  # should handle a set with no repeated anagrams and words with distinct letters [10 points]
  # should handle a set with no repeated anagrams, but words with similar letters [2 points]
  # should handle non-anagrams that have all but one letters the same [2 points]
  # should handle a complicated case of some repeated anagrams, but no duplicates [25 points]
  # should handle a complicated case of some repeated anagrams, but no duplicates [25 points]
  # should handle a simple case of some repeated single-character inputs [2 points]
  # should handle a complicated case of some repeated anagrams, with duplicate inputs [7 points]
  # should handle a complicated case of some repeated anagrams, with duplicate inputs [7 points]
  # should treat single-character capital letters as equal [2 points]
  # should handle repeated single-character inputs, and treat captial letters as anagrams, while preserving case in the output [2 points]
  # should treat two identical words with different cases as the same, and preserve case in output [2 points]
  # should treat many identical words with different cases as the same, and preserve case in output [8 points]

# Finished in 0.02113 seconds
# 15 examples, 0 failures
