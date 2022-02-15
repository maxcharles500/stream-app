class CreateWatchlists < ActiveRecord::Migration[6.1]
  def change
    create_table :watchlists do |t|
      t.date :date_rented
      t.date :expiration
      t.float :price 
      t.float :rating 
      t.integer :movie_id 
      t.integer :user_id
      t.timestamps
    end
  end
end
# —  User Show Watchlist Table
# 		— Rented Shows
# 		— columns:
# 			—  ID (int)
# 			—  Rented on date (date)
# 			—  Rental Expiration (date)
# 			—  Price (float)
# 			—  Rating (float)
# 			—  Show ID (int, foreign key)
# 			—  User ID (int, fireign key)