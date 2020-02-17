class Members::ShippingAddressesController < ApplicationController
  before_action :authenticate_member!

	def index
		@shipping_address = ShippingAddress.new
    @shipping_address.member_id = current_member.id
    @my_shipping_addresses = current_member.shipping_addresses
	end

	def create
  	@shipping_address = ShippingAddress.new(shipping_address_params)
  	@shipping_address.member_id = current_member.id
    @my_shipping_addresses = current_member.shipping_addresses

    @same_shipping_address = ShippingAddress.where(member_id: current_member.id).where(postal_code: @shipping_address.postal_code).where(address: @shipping_address.address).where(name: @shipping_address.name)
    if @same_shipping_address.empty?
      @shipping_address.save
      redirect_to members_shipping_addresses_path, notice: "配送先住所が新規登録されました"
    elsif @same_shipping_address.present?
      flash.now[:alert] = "既に配送先住所に含まれております。"
      render "index"
  	else
      flash.now[:alert] = "#{@shipping_address.errors.count}件のエラーが有ります"
   		render "index"
 	  end
	end

  def edit
    @shipping_address = ShippingAddress.find(params[:id])
  end

  def update
    @shipping_address = ShippingAddress.find(params[:id])
    @shipping_address.update(shipping_address_params)

    if @shipping_address.update(shipping_address_params)
      redirect_to members_shipping_addresses_path, notice: "配送先住所が編集されました"
    else
      flash.now[:alert] = "#{@shipping_address.errors.count}件のエラーが有ります"
      render "edit"
    end

  end

  def destroy
    @shipping_address = ShippingAddress.find(params[:id])
    @shipping_address.destroy
    redirect_to  members_shipping_addresses_path
  end


	private
  def shipping_address_params
  	params.require(:shipping_address).permit(:member_id, :name, :postal_code, :address)
  end
end
