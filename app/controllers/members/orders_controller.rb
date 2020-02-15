class Members::OrdersController < ApplicationController
	def index
		@orders = Order.all
		@order = current_member.orders
		#binding.pry
		@order_items = OrderItem.all
		@cart_items = CartItem.all
		@cart_item = current_member.cart_items
		@shop_items = ShopItem.all
		@shop_item = current_member.shop_items
	end

	def new
  	    if current_member.shop_items.where(sale_status: "売切れ").blank? && Genre.where(id: current_member.shop_items.select(:genre_id), published_status: "無効").blank? && current_member.cart_items.present?  #カート商品の販売ステータス及びジャンルステータスが売切れ、無効でない場合
		    @order = Order.new
		    @order.member_id = current_member.id
		    @order.order_status = 0
		    @order.shipping_fee = 800
		    @shipping_addresses = ShippingAddress.all
    		@my_shipping_addresses = current_member.shipping_addresses
  	    else
  	      redirect_to members_cart_items_path, alert: "大変申し訳ございません。カートが空状態、もしくは売切れ商品がカートにございます。お手数ですが削除してから情報入力にお進みください。"
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
		@order.save

		if @order.save
	      redirect_to members_order_complete_path
	  	else
	      flash.now[:alert] = "#{@order.errors.count}件のエラーが有ります"
	   	  render "new"
	 	end
	end

	def confirm
		@order = Order.new(order_params)
		@order.order_status = "入金待ち"
		@cart_items = CartItem.all
		@cart_item = current_member.cart_items
		#binding.pry
		@shop_items = ShopItem.all
		@shop_item = current_member.shop_items

		@shipping_addresses = ShippingAddress.all
    	@my_shipping_addresses = current_member.shipping_addresses
    	if @order.member_id != 111 && @order.member_id != 222 && @order.member_id != 333
    	   flash.now[:alert] = "いずれかのお届け先を選択ください"
	       render "new"
	 	elsif @order.member_id == 333
	 		if @order.postal_code.empty? || @order.address.empty? || @order.name.empty?
	 			#flash.now[:alert] = "新しいお届け先の記入項目に空欄がございます。ご入力願います"
	 			flash.now[:alert] = "新しいお届け先の記入項目に#{@order.errors.count}件のエラーが有ります"
	       		render "new"
	 		end
	 	end
	end

	def complete
		@cart_items = CartItem.all
		@cart_item = current_member.cart_items
		@cart_item.destroy_all
		#binding.pry
	end

	def show
		@order = Order.find(params[:id])
		@order_items = OrderItem.all
		@order_item = @order.order_items
		#binding.pry
		@order.shipping_fee = 800
		@cart_items = CartItem.all
		@cart_item = current_member.cart_items
		#binding.pry
		@shop_items = ShopItem.all
		@shop_item = current_member.shop_items

		#@order_item = OrderItem.find(params[orders.id])
		#@sum_price = 0
		#@order_item.each do |order_item|
			#@sum_price = @sum_price + (order_item.price * order_item.quantity)
		#end
	end

	private
    def order_params
    	params.require(:order).permit(:registered_add, :member_id, :payment_method, :name, :postal_code, :address, :order_status, :shipping_fee, order_items_attributes:[:id, :order_id, :shop_item_id, :quantity, :price, :production_status])
    end
end
