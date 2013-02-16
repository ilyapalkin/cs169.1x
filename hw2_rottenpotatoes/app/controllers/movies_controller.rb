class MoviesController < ApplicationController

	def show
		id = params[:id] # retrieve movie ID from URI route
		@movie = Movie.find(id) # look up movie by unique ID
		# will render app/views/movies/show.<extension> by default
	end

  def index
  	#@all_ratings = ['G','PG','PG-13','R','NC-17']
		@all_ratings = Movie.all.map(&:rating).uniq
		@selected_ratings = params[:rating] ? params[:rating] : @all_ratings 
		@selected_column = params[:sortby]
		
		unless (session[:rating].eql?(@selected_ratings) && session[:sortby].eql?(params[:sortby]))
			session[:rating] = params.has_key?(:rating) ? params[:rating] : (session[:rating] ? session[:rating] : @selected_ratings)
			session[:sortby] = params.has_key?(:sortby) ? @selected_column : session[:sortby]
			flash.keep
			redirect_to movies_path(:sortby=>session[:sortby], :rating => session[:rating])
		end
  				
		#find 
		@movies = Movie.find(
			:all, 
			:order => @selected_column, 
			:conditions => {:rating => @selected_ratings})
				
		@sortby_title_url = movies_path(:sortby=> 'title', :rating => @selected_ratings)
		@sortby_release_date_url = movies_path(:sortby=> 'release_date', :rating => @selected_ratings)
	end

	def new
		# default: render 'new' template
	end

	def create
		@movie = Movie.create!(params[:movie])
		flash[:notice] = "#{@movie.title} was successfully created."
		redirect_to movies_path
	end

	def edit
		@movie = Movie.find params[:id]
	end

	def update
		@movie = Movie.find params[:id]
		@movie.update_attributes!(params[:movie])
		flash[:notice] = "#{@movie.title} was successfully updated."
		redirect_to movie_path(@movie)
	end

	def destroy
		@movie = Movie.find(params[:id])
		@movie.destroy
		flash[:notice] = "Movie '#{@movie.title}' deleted."
		redirect_to movies_path
	end

end
