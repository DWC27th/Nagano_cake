class Admins::GenresController < ApplicationController

  def index
  	#@genres = Genre.where(published_status: "有効")
    @genres = Genre.all.page(params[:page])
  	@genre = Genre.new
  end

  def create
  	@genre = Genre.new(genre_params)
  	if @genre.save
  	  redirect_to admins_genres_path, notice: "ジャンル情報が登録されました"
    else
      @genres = Genre.all.page(params[:page])
      flash.now[:alert] = "#{@genre.errors.count}件のエラーが有ります"
      render "index"
    end
  end

  def edit
  	@genre = Genre.find(params[:id])
    #if @genre.published_status == "無効"
    #  redirect_to root_path
    #end
  end

  def update
  	@genre = Genre.find(params[:id])
  	if @genre.update(genre_params)
      redirect_to admins_genres_path, notice: "ジャンル情報が更新されました"
    else
      flash.now[:alert] = "#{@genre.errors.count}件のエラーが有ります"
      render "edit"
    end
  end

  private
  def genre_params
    params.require(:genre).permit(:name, :published_status)
  end

end
