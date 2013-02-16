# Add a declarative step here for populating the DB with movies.

Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    Movie.create!(movie)
  end
end

# Make sure that title (regexp) occurs before director on the same page

Then /the director of "(.*)" should be "(.*)"/ do |title, director|
  # ensure that that title occurs before director.
  Movie.find_by_title(title).director.should == director
  page.body.should match /#{title}.+Director:.+#{director}/m
end
