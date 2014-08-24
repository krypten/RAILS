class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :movie_name
      t.text :description
      t.time :duration
      t.string :image_url
      t.string :language
      t.string :certificate
      t.date :release_date

      t.timestamps
    end
  end
end
