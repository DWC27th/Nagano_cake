class Admins::OrdersController < ApplicationController
	def top
		@orders = Order.all
		@today_orders_num = 0
		@orders.each do |order|
			if (order[:created_at].to_s.match(/#{Date.today.to_s}.+/))
				@today_orders_num = @today_orders_num + 1
			end
		end
	end

	def index
		@path = Rails.application.routes.recognize_path(request.referer)

	    @before_controller = @path[:controller]
	    @before_action = @path[:action]

		@orders = Order.all
		@order_items = OrderItem.all
		@members = Member.all
	end

	def show
		@order = Order.find(params[:id])
		@order_items = OrderItem.all
		@order_item = @order.order_items
		@order.shipping_fee = 800

		@shop_items = ShopItem.all

		@members = Member.all
	end

	def update
	  	@order = Order.find(params[:id])
	  	@order_items = OrderItem.all
		@order_item = @order.order_items
		@num = @order_item.count
		@order.update(order_params)
		if @order.order_status == "入金確認"
	  		@order_item.each do |order_item|
				if order_item.production_status == "着手不可"
				    order_item.production_status = "製作待ち"
				    @order.update(order_params)
				else order_item.production_status == "製作中"
					@order.update(order_status: 2)
				end
			end
		elsif @order.order_status == "製作中"
			cooked_item = 0
			@order_item.each do |order_item|
				if order_item.production_status == "製作完了"
					cooked_item = cooked_item + 1
				    if cooked_item == @num
				    	@order.update(order_status: 3)
				    end
				end
			end
		end
	      redirect_to admins_order_path(@order)
  	end

  	private
    def order_params
    	params.require(:order).permit(:member_id, :payment_method, :name, :postal_code, :address, :order_status, :shipping_fee, order_items_attributes:[:id, :order_id, :shop_item_id, :quantity, :price, :production_status])
    end
end