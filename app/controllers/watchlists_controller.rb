class WatchlistsController < ApplicationController
   def index 
     watchlists = Watchlist.all 
     render json: watchlists
   end
   def create 
        new_watchlist = Watchlist.new(watchlist_params)
        if new_watchlist.save 
        render json: new_watchlist, status: :created
        else 
            render json: {error:watchlist.errors.full_messages}, status: :unprocessable_entity 
        end
        
    end 
    def destroy
        watchlist = find_watchlist
        watchlist.destroy
        head :no_content 
    end

    private 

    def find_watchlist
        Watchlist.find(params[:id]) 
    end

    def watchlist_params 
       params.permit(:date_rented, :expiration, :price, :rating, :movie_id, :user_id)
    end
end
