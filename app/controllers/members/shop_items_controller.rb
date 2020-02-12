class Members::ShopItemsController < ApplicationController

  def top
    #@genres = Genre.all
    @genres = Genre.where(published_status: "有効")  #ステータスが有効なジャンルのみ取得
    #@shop_items = ShopItem.all
    @shop_items = ShopItem.where(genre_id: @genres.ids, sale_status: "販売中")  #ステータスが有効なジャンルに紐付いた商品かつ販売中の商品だけを取得
  end

  def about
  end

  def index
    unless params[:genre_id].nil?  #ジャンル検索フォームからlink_toで受け取ったパラメータ値がnilでない場合
      @genre = Genre.find(params[:genre_id])
      #@genres = Genre.all
      @genres = Genre.where(published_status: "有効")  #ステータスが有効なジャンルのみ取得
      @shop_items = @genre.shop_items.where(sale_status: "販売中")  #ジャンルに紐付く商品かつ販売中の商品を取得
    else
      redirect_to root_path  #nilの場合topページへ遷移
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