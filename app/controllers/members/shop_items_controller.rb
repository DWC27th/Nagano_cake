class Members::ShopItemsController < ApplicationController

  def top
    @shop_items = ShopItem.all
  end

  def about
  end

  def index
    @shop_items = ShopItem.all
  end

  def show
    @shop_item = ShopItem.find(params[:id])
    @genre = Genre.find(@shop_item.genre_id)
  end

end
