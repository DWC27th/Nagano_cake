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
		@order = Order.new
		@order.member_id = current_member.id
		@shipping_addresses = ShippingAddress.all
		@order.order_status = "入金待ち"
		@order.shipping_fee = 800

    	@my_shipping_addresses = current_member.shipping_addresses
    	#binding.pry
	end

	def create
		@cart_items = CartItem.all
		@cart_item = current_member.cart_items
		@shop_items = ShopItem.all
		@shop_item = current_member.shop_items

		@order = Order.new(order_params)
		@order.member_id = current_member.id
		@order.order_status = "入金待ち"
		@order.shipping_fee = 800
		@order.save

		redirect_to members_order_complete_path
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
