class CartsController < ApplicationController
  before_action :validate_product, only: :move

  def move
    line_item = current_cart.line_items.where(product_id: @product.id).first_or_initialize
    line_item.quantity += params[:quantity].to_i
    line_item.update_attribute(:unit_price, @product.price)
    redirect_to product_path(@product.id), flash: { success: 'Successfully Added to cart!' }
  end

  def show
    @cart = Cart.pending.includes(line_items: [product: :category]).find_by_id(current_cart.id)

    redirect_to(root_path, flash: { success: 'Thanks for placing the order!' }) if @cart.blank?
  end

  def checkout
    current_cart.checkout

    redirect_to root_path, flash: { success: 'Thanks for placing the order!' }
  end

  private

  def validate_product
    return if (@product = Product.find_by_id(params[:product_id])).present? && @product.published?

    redirect_to root_path, flash: { error: 'Product Unavailable' }
  end
end
