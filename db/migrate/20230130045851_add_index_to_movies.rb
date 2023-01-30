class AddIndexToMovies < ActiveRecord::Migration[7.0]
  def change
    add_index :movies, :title
  end
end
