class Members::OrdersController < ApplicationController
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


	private
    def order_params
    	params.require(:order).permit(:member_id, :payment_method, :name, :postal_code, :address, :order_status, :shipping_fee)
    end
end
