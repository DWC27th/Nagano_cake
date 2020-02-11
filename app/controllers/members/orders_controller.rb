class Members::OrdersController < ApplicationController
	def index
		@orders = Order.all
		#@order_items = OrderItem.all
		#@order_item = OrderItem.find(params[orders.id])
	end

	def new
		@order = Order.new
		@order.member_id = current_member.id
		@shipping_addresses = ShippingAddress.all
		@order.order_status = 0
		@order.shipping_fee = 800
	end

	def create
		@order = Order.new(order_params)
		@order.member_id = current_member.id
		@order.order_status = 0
		@order.shipping_fee = 800
		@order.save
		redirect_to members_order_complete_path
	end

	def confirm
		@order = Order.new(order_params)
		@order.member_id = current_member.id
		@order.order_status = 0
		@order.shipping_fee = 800
	end

	def complete
	end

	def show
		@order = Order.find(params[:id])
		#@order_item = OrderItem.find(params[orders.id])
		#@sum_price = 0
		#@order_item.each do |order_item|
			#@sum_price = @sum_price + (order_item.price * order_item.quantity)
		#end
	end


	private
    def order_params
    	params.require(:order).permit(:member_id, :payment_method, :name, :postal_code, :address, :order_status, :shipping_fee)
    end
end
