class Members::ShopItemsController < ApplicationController

  def top
    @shop_items = ShopItem.all
    @genres = Genre.all
  end

  def about
  end

  def index
    @genres = Genre.all
  	@genre = Genre.find(params[:genre_id])
    @shop_items = @genre.shop_items
  end

  def show
    @shop_item = ShopItem.find(params[:id])
    @genres = Genre.all
    @genre = Genre.find(@shop_item.genre_id)
    @cart_item = CartItem.new
  end

end
