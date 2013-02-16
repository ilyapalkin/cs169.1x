require 'spec_helper'

describe MoviesHelper do
	
	describe 'oddness method' do	
		before :each do
			@n = rand(100)
		end
		
		it 'should return "even" if count is 0,2,4,...2n' do
			oddness(0).should == "even"
			oddness(2).should == "even"
			oddness(2*@n).should == "even"
		end
		
		it 'should return "odd" if count is 1,3,5,...2n+1' do
			oddness(1).should == "odd"
			oddness(3).should == "odd"
			oddness(2*@n+1).should == "odd"
		end
	end
end
