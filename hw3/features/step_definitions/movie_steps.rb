# Add a declarative step here for populating the DB with movies.

Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    Movie.create!(movie)
  end
  @all_movies_count = movies_table.hashes.count
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  flunk "Unimplemented"
end

# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
	# HINT: use String#split to split up the rating_list, then
	#   iterate over the ratings and reuse the "When I check..." or
	#   "When I uncheck..." steps in lines 89-95 of web_steps.rb
	rating_list.split(/,\s*/).each do |rating|
		rating = "ratings_#{rating}"
		if uncheck 
			uncheck(rating)
		else
			check(rating)
		end
	end
end

# Custom steps
Then /I should (not )?see the following movies: (.*)/ do |should_not, movie_list|
  movie_list.split(/,\s*/).each do |movie|
    if should_not
      assert page.has_no_css?('#movies td', :text => "#{movie}")
    else
      assert page.has_css?('#movies td', :text => "#{movie}")
    end
  end
end

Then /I should see all of the movies/ do
	# ensure that all movies are shown.
	page.all('#movies tbody tr').count.should == @all_movies_count
end





