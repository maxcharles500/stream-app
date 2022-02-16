class MoviesController < ApplicationController

    def index 
        movies = Movie.all
        render json: movies
    end
    def show
        movie = Movie.find(params[:id])
        render json: movie
    end
    def update 
        movie = Movie.find(params[:id])
        movie.update!(movie_params)
        
    end
    def create 
        new_movie = Movie.new(movie_params)
        if new_movie.save 
        render json: new_movie, status: :created
        else 
            render json: {error:movie.errors.full_messages}, status: :unprocessable_entity 
        end
        
    end 
    def destroy
        movie = find_movie
        movie.destroy
        head :no_content 
    end
    
    private 
    def find_movie
        Movie.find(params[:id]) 
    end

    def movie_params 
        params.permit(:title, :director, :description, :genre, :price, :rating, :runtime, :released, :image)
     end

end
