class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :username 
      t.string :password 
      t.string :email 
      t.string :address 
      t.string :name 
      t.string :phone

      t.timestamps
    end
  end
end
# User Table
# 		—  User Class
# 		—  Columns:
# 			—  ID (int)
# 			—  Username(str)
# 			—  Password(str)
# 			—  Email  (str)
# 			—  Address  (str)
# 			—  Name (str)
# 			—  Phone (str)