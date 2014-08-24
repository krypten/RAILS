class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_filter :authorize
  protect_from_forgery with: :exception

  private
    def current_cart
      Cart.find(session[:card_id])
    rescue ActiveRecord::RecordNotFound
      cart = Cart.create
      session[:cart_id] = cart.id
      cart
    end

  protected
    def authorize
      unless User.find_by_id(session[:user_id])
        redirect_to login_url, notice => "Please Log in"
      end
    end
end


