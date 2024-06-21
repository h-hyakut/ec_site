class ApplicationController < ActionController::Base
  before_action :current_cart

  def after_sign_in_path_for(resources)
    session[:user_id] = current_user.id if current_user.present?
    mypage_path
  end

  def after_sign_out_path_for(resources)
    new_user_session_path
  end

  private

  def current_cart
    @current_cart = Cart.find_or_create_by(id: session[:cart_id])
    session[:cart_id] = @current_cart.id
    @current_cart
  end
end


