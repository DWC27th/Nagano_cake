class Members::OrdersController < ApplicationController
    before_action :authenticate_member!

	def index
		@orders = Order.all
		@order = current_member.orders.page(params[:page])
		@order_items = OrderItem.all

		@shop_items = ShopItem.all
	end

	def new
	    if current_member.cart_items.present?
  	        if current_member.shop_items.where(sale_status: "売切れ").blank? && Genre.where(id: current_member.shop_items.select(:genre_id), published_status: "無効").blank? && current_member.cart_items.present?  #カート商品の販売ステータス及びジャンルステータスが売切れ、無効でない場合
		        @order = Order.new
		        @order.member_id = current_member.id
		        @order.order_status = 0
		        @order.shipping_fee = 800
		        @shipping_addresses = ShippingAddress.all
    	    	@my_shipping_addresses = current_member.shipping_addresses
    	    	@new_shipping_address = ShippingAddress.new
  	        else
  	          redirect_to members_cart_items_path, alert: "大変申し訳ございません。売切れ商品がカートにございます。お手数ですが削除してから情報入力にお進みください。"
  	        end
	 	else
            redirect_to members_cart_items_path, alert: "カートは空の為、注文できません。"
	   	end
	end

	def create
		@cart_items = CartItem.all
		@cart_item = current_member.cart_items
		@shop_items = ShopItem.all
		@shop_item = current_member.shop_items
		@shipping_addresses = ShippingAddress.all
    	@my_shipping_addresses = current_member.shipping_addresses

		@order = Order.new(order_params)
		@order.member_id = current_member.id
		@order.order_status = "入金待ち"
		@order.shipping_fee = 800

		@new_shipping_address = ShippingAddress.new
		@new_shipping_address.member_id = current_member.id
        @new_shipping_address.postal_code = @order.postal_code
        @new_shipping_address.address = @order.address
        @new_shipping_address.name = @order.name

        @same_shipping_address = ShippingAddress.where(member_id: current_member.id).where(postal_code: @order.postal_code).where(address: @order.address).where(name: @order.name)
      	if @same_shipping_address.empty?
		    @new_shipping_address.save
		end

	    if current_member.cart_items.present?
		    if @order.save
	            redirect_to members_order_complete_path
	  	    else
	            flash.now[:alert] = "#{@order.errors.count}件のエラーが有ります"
	   	        render "new"
	 	    end
	 	else
            redirect_to members_cart_items_path, alert: "カートは空の為、注文できません。"
	   	end
	end

	def confirm
	    if current_member.cart_items.present?
		    @order = Order.new(order_params)
		    @order.order_status = "入金待ち"
		    @cart_items = CartItem.all
		    @cart_item = current_member.cart_items
		    @shop_items = ShopItem.all
		    @shop_item = current_member.shop_items

		    @new_shipping_address = ShippingAddress.new

    	    @my_shipping_addresses = current_member.shipping_addresses
    	    if order_params[:payment_method].blank? && @order.member_id.blank?
	 	      flash.now[:alert] = "支払方法、お届け先が入力されていません"
	 	      render "new"
    	    elsif @order.member_id.blank?
	 	      flash.now[:alert] = "お届け先が入力されていません"
	 	      render "new"
	 	    elsif @order.member_id == 333
	 	      @order.save
	 	      @order.errors.delete(:member)
	 	      if @order.errors.present?
	 	        flash.now[:alert] = "#{@order.errors.count}件のエラーが有ります"
	 	        render "new"
	 	      end
	 	    end
        else
            redirect_to members_cart_items_path, alert: "カートは空の為、注文できません。"
        end
	end

	def complete
		@cart_items = CartItem.all
		@cart_item = current_member.cart_items
		@cart_item.destroy_all
	end

	def show
		@order = Order.find(params[:id])
		@order_items = OrderItem.all
		@order_item = @order.order_items
		@order.shipping_fee = 800
		@cart_items = CartItem.all
		@cart_item = current_member.cart_items
		@shop_items = ShopItem.all
		@shop_item = current_member.shop_items
	end

	private
    def order_params
    	params.require(:order).permit(:member_id, :payment_method, :name, :postal_code, :address, :order_status, :shipping_fee, order_items_attributes:[:id, :order_id, :shop_item_id, :quantity, :price, :production_status])
    end

end
