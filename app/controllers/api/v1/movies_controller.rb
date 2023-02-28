# frozen_string_literal: true

# Controller to handle the moview request
class Api::V1::MoviesController < Api::V1::ApplicationController

  def index
    @movies = Movie.all
    render json: @movies
  end

  def show

    begin
      @movie = Movie.find(params[:id])
      render json: @movie
    rescue
      render json: {status: "ERROR", message: "Movie could not be found"}, status: :bad_request
    end
    
  end

  def new
    @movie = Movie.new
    render json: @movie
  end

  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      render json: @movie
    else
      render json: {status: "ERROR", message: "Movie unable to be created", data: @movie}, status: :unprocessable_entity
    end
  end

  def edit
    @movie = Movie.find(params[:id])
    render json: @movie
  end

  def update
    @movie = Movie.find(params[:id])

    if @movie.update
      render json: @movie
    else
      render json: {status: "ERROR", message: "Movie unable to be updated", data: @movie}, status: :unprocessable_entity
    end
  end

  def destroy
    @movie = movie.find(params[:id])
    @movie.destroy

    render json: {status: "SUCCESS", message: "Movie deleted successfully", data: @movie }, status: :ok
  end

  private

  def movie_params
    params.require(:movie).permit(:imdb_id, :title, :rating, :rank, :year, :data)
  end
end
