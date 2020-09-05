class Admins::GenresController < ApplicationController

  before_action :authenticate_admin!

  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def edit
  end

  def create
    @genre = Genre.new(genre_params)
    @genre.save
    redirect_to admins_genres_path
  end

  private
  def genre_params
    params.require(:genre).permit(:name)
  end
end
