class Members::ShippingAddressesController < ApplicationController
	def index
		@shipping_address = ShippingAddress.new
		@shipping_addresses = ShippingAddress.all

    @my_shipping_addresses = current_member.shipping_addresses
    #binding.pry
	end

	def create
		shipping_addresses = ShippingAddress.all
  	shipping_address = ShippingAddress.new(shipping_address_params)
  	shipping_address.member_id = current_member.id
  	if shipping_address.save
  		flash[:notice] = "shipping_address was successfully created."
  		redirect_to  members_shipping_addresses_path
  	else
   		render action: :index
 	  end
	end

  def edit
    @shipping_address = ShippingAddress.find(params[:id])
  end

  def update
    shipping_address = ShippingAddress.find(params[:id])
    shipping_address.update(shipping_address_params)
    redirect_to  members_shipping_addresses_path
  end

  def destroy
    shipping_address = ShippingAddress.find(params[:id])
    shipping_address.destroy
    redirect_to  members_shipping_addresses_path
  end


	private
  def shipping_address_params
  	params.require(:shipping_address).permit(:member_id, :name, :postal_code, :address)
  end
end
