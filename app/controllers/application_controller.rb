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

  protected
  def configure_permitted_parameters
    added_attrs = [ :member_status, :email, :password, :password_confirmation, :last_name, :first_name, :last_name_kana, :first_name_kana,:postal_code, :address, :phone_number]
    devise_parameter_sanitizer.permit(:sign_up, keys: added_attrs)
    devise_parameter_sanitizer.permit(:account_update, keys: added_attrs)
  end

end