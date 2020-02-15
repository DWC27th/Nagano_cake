class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    case resource
      when Admin
        admins_top_path
      when Member
        members_top_path
      end
  end

  def after_sign_out_path_for(resource)
    new_member_session_path
  end

  def shop_item_genre_enable?  #取得した商品に紐づくジャンルステータスが無効な場合rootへ遷移
    @shop_item = ShopItem.find(params[:id])
    @genre = Genre.find(@shop_item.genre_id)
    if @genre.published_status == "無効"
      redirect_to root_path
    end
  end

  def shop_item_enable?  #取得した商品の販売ステータスが販売停止中の場合rootへ遷移
    @shop_item = ShopItem.find(params[:id])
    if @shop_item.sale_status == "販売停止中"
      redirect_to root_path
    end
  end

  protected
  def configure_permitted_parameters
    added_attrs = [ :member_status, :email, :password, :password_confirmation, :last_name, :first_name, :last_name_kana, :first_name_kana,:postal_code, :address, :phone_number]
    devise_parameter_sanitizer.permit(:sign_up, keys: added_attrs)
    devise_parameter_sanitizer.permit(:account_update, keys: added_attrs)
  end

end