class LineItemsController < ApplicationController
  def destroy
    LineItem.find_by_id(params[:id]).try(:destroy)

    redirect_to cart_path(current_cart.id), notice: 'Updated successfully!'
  end
end
