class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.string :imdb_id
      t.string :title
      t.decimal :rating
      t.integer :rank
      t.integer :year
      t.jsonb :data

      t.timestamps
    end
  end
end
