class Members::ShippingAddressesController < ApplicationController
	def index
		@shipping_address = ShippingAddress.new
		@shipping_addresses = ShippingAddress.all

    @my_shipping_addresses = current_member.shipping_addresses
    #binding.pry
	end

	def create
		@shipping_addresses = ShippingAddress.all
  	@shipping_address = ShippingAddress.new(shipping_address_params)
  	@shipping_address.member_id = current_member.id
    @my_shipping_addresses = current_member.shipping_addresses
  	if @shipping_address.save
      redirect_to members_shipping_addresses_path, notice: "配送先住所が新規登録されました"
  	else
      #flash.now[:alert] = "空欄の項目がございます。入力の上ご登録願います"
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
      #flash.now[:alert] = "空欄の項目がございます。入力の上ご編集願います"
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
