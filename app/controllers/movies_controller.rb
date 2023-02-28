# frozen_string_literal: true

# Controller to handle the moview request
class MoviesController < ApplicationController
  before_action :authenticate_admin!, only: [:new, :edit, :destroy]

  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      redirect_to @movie
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])

    if @movie.update
      redirect_to @movie
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @movie = movie.find(params[:id])
    @movie.destroy

    redirect_to movies_path, status: :see_other
  end

  def top
    MovieFetcher.call
    redirect_to movies_path
  end

  private

  def movie_params
    params.require(:movie).permit(:imdb_id, :title, :rating, :rank, :year, :data)
  end
end
