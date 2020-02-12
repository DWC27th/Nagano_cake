class Admins::ShopItemsController < ApplicationController

  def index
    @genres = Genre.where(published_status: "有効")  #ステータスが有効なジャンルのみ取得
    #@shop_items = ShopItem.all
    @shop_items = ShopItem.where(genre_id: @genres.ids)  #ステータスが有効なジャンルに紐付いた商品だけを取得
  end

  def new
    @shop_item = ShopItem.new
  end

  def create
    @shop_item = ShopItem.new(shop_item_params)
    @shop_item.save
    redirect_to admins_shop_items_path
  end

  def show
    shop_item_genre_enable?  #application_controllerにて定義
  end

  def edit
    shop_item_genre_enable?  #application_controllerにて定義
  end

  def update
    @shop_item = ShopItem.find(params[:id])
    @shop_item.update(shop_item_params)
    redirect_to admins_shop_item_path(@shop_item.id)
  end

  private
  def shop_item_params
    params.require(:shop_item).permit(:genre_id, :name, :introduction, :price, :image, :sale_status)
  end

end