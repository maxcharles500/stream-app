class Watchlist < ApplicationRecord
    belongs_to :movie
    belongs_to :user
end
