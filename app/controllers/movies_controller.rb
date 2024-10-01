class MoviesController < ApplicationController
  before_action :set_movie, only: [ :show, :edit, :update, :destroy ]

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
  end

  # GET /movies/new
  def new
    @movie = Movie.new
  end

  def edit
    # @movie is already set by the set_movie method
  end

  # PATCH/PUT /movies/1
  def update
    @movie = Movie.find params[:id]
    @movie.update!(movie_params)
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
  end

  def create
    @movie = Movie.create!(movie_params)
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end



  def index
    sort_column = params[:sort] || session[:sort] || "title"
    sort_direction = params[:direction] || session[:direction] || "asc"

    session[:sort] = sort_column if params[:sort]
    session[:direction] = sort_direction if params[:direction]

    @movies = Movie.order("#{sort_column} #{sort_direction}")
  end

  private
  def set_movie
    @movie = Movie.find(params[:id])
  end


  def movie_params
    params.require(:movie).permit(:title, :rating, :release_date, :description)
  end
end
