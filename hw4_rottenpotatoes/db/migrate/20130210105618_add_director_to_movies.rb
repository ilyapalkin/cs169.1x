# http://guides.rubyonrails.org/migrations.html
# rails generate migration add_director_to_movies director:string
# rake db:test:prepare
class AddDirectorToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :director, :string
  end
end
