class Members::CartItemsController < ApplicationController

  def index
  	@shop_items = current_member.shop_items
  	@cart_items = current_member.cart_items
  end

  def create
  	@cart_item = CartItem.new(cart_item_params)
  	@cart_item.member_id = current_member.id
  	@cart_item.save
  	redirect_to members_cart_items_path
  end

  def update
  	@cart_item = CartItem.find(params[:id])
  	@cart_item.update(cart_item_params)
  	redirect_to members_cart_items_path
  end

  def destroy
  	if params[:id].present?
      cart_item = CartItem.find(params[:id])
      cart_item.destroy
      redirect_to members_cart_items_path
    else
      cart_items = CartItem.all
      cart_items.destroy_all
      redirect_to members_cart_items_path
    end
  end

  private
  def cart_item_params
  	params.require(:cart_item).permit(:shop_item_id, :quantity)
  end

end
