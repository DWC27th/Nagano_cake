class Members::ShopItemsController < ApplicationController

  def top
    #@genres = Genre.all
    @genres = Genre.where(published_status: "有効")  #ステータスが有効なジャンルのみ取得
    #@shop_items = ShopItem.all
    @shop_items = ShopItem.where(genre_id: @genres.ids)  #ステータスが有効なジャンルに紐付いた商品だけを取得
    @shop_items = @shop_items.page(params[:page])
  end

  def about
  end

  def index
    if Genre.where(id: params[:genre_id]).present? #ジャンル検索フォームからlink_toで受け取ったパラメータのジャンルidがデータベースに存在する場合
      @genre = Genre.find(params[:genre_id])
      #@genres = Genre.all
      if @genre.published_status == "有効" #ジャンルステータスが有効の場合
        @genres = Genre.where(published_status: "有効")  #ステータスが有効なジャンルのみ取得
        @shop_items = @genre.shop_items  #ジャンルに紐付く商品を取得
        @shop_items = @shop_items.page(params[:page])
      end
    else
      redirect_back fallback_location: root_path
    end
  end

  def show
    shop_item_genre_enable?  #application_controllerにて定義
    shop_item_enable?  #application_controllerにて定義
    #@genres = Genre.all
    @genres = Genre.where(published_status: "有効")  #ステータスが有効なジャンルのみ取得
    @cart_item = CartItem.new
  end

end