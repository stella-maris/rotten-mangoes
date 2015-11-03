class MoviesController < ApplicationController
  
  def index
    @movies = Movie.all
    @movies = @movies.search_by_title(params[:title])
    @movies = @movies.search_by_director(params[:director]) 
    

    # if params[:title] || params[:director]
    #   @movies = @movies.search_by_title(params[:title]).order("created_at DESC")
    #   @movies = @movies.search_by_director(params[:director])
    # elsif params[:title] && params[:director]
    #   @movies = Movie.search_by_both()
    # else
    #   @movies = Movie.all.order("created_at DESC")
    # end

    @movies = @movies.order("created_at DESC")
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      redirect_to movies_path, notice: "#{@movie.title} was submitted successfully!"
    else
      render :new
    end
  end

  def update
    @movie = Movie.find(params[:id])

    if @movie.update_attributes(movie_params)
      redirect_to movie_path(@movie)
    else
      render :edit
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to movies_path
  end

  protected

  def movie_params
    params.require(:movie).permit(
      :title, :release_date, :director, :runtime_in_minutes, :image, :description, :remote_image_url
      )
  end
end
