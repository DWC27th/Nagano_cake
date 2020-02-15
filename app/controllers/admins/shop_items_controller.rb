class Admins::ShopItemsController < ApplicationController

  def index
    @shop_items = ShopItem.all
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
    @shop_item = ShopItem.find(params[:id])
    @genre = Genre.find(@shop_item.genre_id)
  end

  def edit
    @shop_item = ShopItem.find(params[:id])
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