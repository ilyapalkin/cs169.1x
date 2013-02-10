require 'spec_helper'

describe Movie do
	
	describe 'all_ratings property' do
		it 'should return list of all ratings' do
			Movie.all_ratings.should == ["G", "PG", "PG-13", "NC-17", "R"]
		end
	end
	
	describe 'by_director method' do	
		it 'should return movies filtered by director' do
			expected_director = 'any director'
			expected_movies = 'some movies'
			Movie.should_receive(:where)
				.with({:director => expected_director})
				.and_return(expected_movies)
			Movie.by_director(expected_director).should be expected_movies
		end
	end
end
