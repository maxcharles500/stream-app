class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :director
      t.string :description
      t.string :genre 
      t.float :price 
      t.float :rating 
      t.string :runtime
      t.date :released
      t.string :image
      t.timestamps
    end
  end
end
