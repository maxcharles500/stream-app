class Movie < ApplicationRecord
     has_many :watchlists
     has_many :users, through: :watchlists
end
