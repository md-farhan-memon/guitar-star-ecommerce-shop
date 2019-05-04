class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception, prepend: true
  skip_before_action :verify_authenticity_token

  helper_method :current_cart

  def current_cart
    @current_cart ||= find_or_create_cart
  end

  private

  def find_or_create_cart
    if (cart_id = cookies.signed[:cart_id]).present? && (old_cart = Cart.pending.find_by_id(cart_id))
      old_cart
    else
      new_cart = Cart.create
      cookies.signed[:cart_id] = new_cart.id
      new_cart
    end
  end
end
