class Admins::GenresController < ApplicationController

  def index
  	#@genres = Genre.where(published_status: "有効")
    @genres = Genre.all
  	@genre = Genre.new
  end

  def create
  	@genre = Genre.new(genre_params)
  	@genre.save
  	redirect_to admins_genres_path
  end

  def edit
  	@genre = Genre.find(params[:id])
    #if @genre.published_status == "無効"
    #  redirect_to root_path
    #end
  end

  def update
  	@genre = Genre.find(params[:id])
  	@genre.update(genre_params)
  	redirect_to admins_genres_path
  end

  private
  def genre_params
    params.require(:genre).permit(:name, :published_status)
  end

end
