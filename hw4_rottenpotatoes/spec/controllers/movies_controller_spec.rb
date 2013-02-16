require 'spec_helper'

describe MoviesController do
	before :each do
		@movie = mock(Movie, :id => "100500", :title => "any title")
		Movie.stub(:find).with(@movie.id).and_return(@movie)
	end

	describe 'show method' do
		it 'should assign @movie by :id from params' do
			get :show, :id => @movie.id
			assigns(:movie).should be @movie
		end
	end
	
	describe 'index method' do
		before :each do
			@dummy_movies = "dummy movies"
		end
		it 'should return movies filtered by rating' do
			Movie.stub(:find_all_by_rating).and_return(@dummy_movies)
			get :index
			assigns(:movies).should be @dummy_movies
		end
		it 'should highlight title if movies are sorted by title' do
			get :index, :sort => 'title'
			assigns(:title_header).should == 'hilite'
			assigns(:date_header).should be nil
		end
		it 'should highlight release_date if movies are sorted by release_date' do
			get :index, :sort => 'release_date'
			assigns(:date_header).should == 'hilite'
			assigns(:title_header).should be nil
		end
		it 'should test depending in session[] and params[] redirects.'
	end

	describe 'create method' do
		before :each do
			@form_data = "some data"
			Movie.should_receive(:create!).with(@form_data).and_return(@movie)
		end
		it 'should show "movie created" notification' do
			post :create, :movie => @form_data
			flash[:notice].should == "#{@movie.title} was successfully created."
		end
		it 'should redirect to "home page"' do
			post :create, :movie => @form_data
			response.should redirect_to movies_path
		end
	end

	describe 'edit method' do
		it 'should assign @movie by :id from params' do
			get :edit, :id => @movie.id
			assigns(:movie).should be @movie
		end
	end

	describe 'update method' do
		before :each do
			@form_data = "some data"
			@movie.should_receive(:update_attributes!).with(@form_data)
		end
		it 'should show "movie updated" notification' do
			post :update, {:id => @movie.id, :movie => @form_data}
			flash[:notice].should == "#{@movie.title} was successfully updated."
		end
		it 'should redirect to "show movie page"' do
			post :update,  {:id => @movie.id, :movie => @form_data}
			response.should redirect_to movie_path(@movie)
		end
	end

	describe 'same_director method' do
		before :each do
			@dummy_movies = "dummy movies"
			@not_empty_director = "not empty"
			@empty_director = ""
			Movie.stub(:by_director).and_return(@dummy_movies)
		end
		it 'should invoke search by director with the correct director name and assign @movies' do
			@movie.stub(:director).and_return(@not_empty_director)
			Movie.should_receive(:by_director).with(@not_empty_director)
			get :same_director, :id => @movie.id
			assigns(:movies).should be @dummy_movies
		end
		it 'should redirect to "home page" if director is empty' do
			@movie.stub(:director).and_return(@empty_director)
			get :same_director, :id => @movie.id
			response.should redirect_to movies_path
		end
		it 'should show correct notification if director is empty' do
			@movie.stub(:director).and_return(@empty_director)
			get :same_director, :id => @movie.id
			flash[:notice].should == "'#{@movie.title}' has no director info."
		end
		it 'should not invoke search by director if director is empty' do
			@movie.stub(:director).and_return(@empty_director)
			Movie.should_not_receive(:by_director).with(@empty_director)
			get :same_director, :id => @movie.id
		end
	end

	describe 'destroy method' do
		before :each do
			@movie.should_receive(:destroy)
		end
		it 'should show "movie deleted" notification' do
			delete :destroy, :id => @movie.id
			flash[:notice].should == "Movie '#{@movie.title}' deleted."
		end
		it 'should redirect to movies "home page"' do
			delete :destroy, :id => @movie.id
			response.should redirect_to movies_path
		end
	end

end
