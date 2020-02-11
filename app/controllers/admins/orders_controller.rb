class Admins::OrdersController < ApplicationController

	def index
		@orders = Order.all
		#@order_items = OrderItem.all
		#@order_item = OrderItem.find(params[orders.id])

		#@order_item = OrderItem.find(params[orders.id])
		#@sum_quantity = 0
		#@order_item.each do |order_item|
			#@sum_quantity = @sum_quantity + order_item.quantity
			#@sum =+
		#end
	end
	def show
		@order = Order.find(params[:id])
		#@order_item = OrderItem.find(params[orders.id])
		#@sum_price = 0
		#@order_item.each do |order_item|
			#@sum_price = @sum_price + (order_item.price * order_item.quantity)
		#end
	end
end