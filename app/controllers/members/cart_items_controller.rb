class Members::CartItemsController < ApplicationController

  def index
  	@shop_items = current_member.shop_items
  	@cart_items = current_member.cart_items
  end

  def create
    if ShopItem.find(cart_item_params[:shop_item_id]).sale_status == "販売中"  #販売ステータスが"販売中"の商品の場合
      if CartItem.find_by(shop_item_id: cart_item_params[:shop_item_id]).blank?  #カート商品の中に重複している商品が無い場合
    	  @cart_item = CartItem.new(cart_item_params)
    	  @cart_item.member_id = current_member.id
        if @cart_item.save
          redirect_to members_cart_items_path, notice: "カートに商品が登録されました"
        else
          redirect_back fallback_location: root_path, alert: "カートに入れる商品の個数を選択してください"
        end
      elsif cart_item_params[:quantity].present?  #カートに追加する商品の個数が選択されている場合
        @cart_item = CartItem.find_by(shop_item_id: cart_item_params[:shop_item_id])
        @cart_item.quantity = @cart_item.quantity + cart_item_params[:quantity].to_i  #既存のカート商品個数に加算
        if @cart_item.save
          redirect_to members_cart_items_path, notice: "カート商品の個数が更新されました"
        else
          redirect_back fallback_location: root_path, alert: "カートに入れる商品の個数を選択してください"
        end
      else
        redirect_back fallback_location: root_path, alert: "カートに入れる商品の個数を選択してください"
      end
    end
  end

  def update
  	@cart_item = CartItem.find(params[:id])
  	if @cart_item.update(cart_item_params)
  	  redirect_to members_cart_items_path, notice: "カート商品の個数が更新されました"
    else
      redirect_to members_cart_items_path, alert: "個数は1以上の数字を入力してください"
    end
  end

  def destroy
  	if params[:id].present?  #カート商品のパラメータ(id)が存在する場合・・・カート商品単体の削除
      cart_item = CartItem.find(params[:id])
      cart_item.destroy
      redirect_to members_cart_items_path, notice: "カート商品が削除されました"
    else  #カート商品のパラメータ(id)が存在しない場合・・・カート商品全体の削除＝カートを空にする
      cart_items = CartItem.all
      cart_items.destroy_all
      redirect_to members_cart_items_path, notice: "カート商品が空になりました"
    end
  end

  private
  def cart_item_params
  	params.require(:cart_item).permit(:shop_item_id, :quantity)
  end

end
