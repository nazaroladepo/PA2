class MoviesController < ApplicationController
\
  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movies.find(id) # look up movie by unique ID
  end

  # GET /movies/new
  def new
    @movie = Movies.new
  end

  def edit
    @movie = Movies.find params[:id]
  end


  def index
    sort_column = params[:sort] || session[:sort] || "title"
    sort_direction = params[:direction] || session[:direction] || "asc"

    session[:sort] = sort_column if params[:sort]
    session[:direction] = sort_direction if params[:direction]

    @movies = Movies.order("#{sort_column} #{sort_direction}")
  end



    def movie_params
      params.require(:movie).permit(:title, :rating, :description, :release_date)
    end
end
