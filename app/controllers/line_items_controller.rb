class LineItemsController < ApplicationController
  before_action :set_line_item

  def update
    @line_item.update_attribute(:quantity, params[:quantity]) if @line_item.present?
    redirect_to_cart
  end

  def destroy
    @line_item.destroy if @line_item.present?
    redirect_to_cart
  end

  private

  def set_line_item
    @line_item = LineItem.find_by_id(params[:id])
    redirect_to_cart(error: 'Item not found.') if @line_item.blank?
  end

  def redirect_to_cart(flash = { notice: 'Cart updated successfully!' })
    redirect_to(cart_path(current_cart.id), flash: flash) and return
  end
end
