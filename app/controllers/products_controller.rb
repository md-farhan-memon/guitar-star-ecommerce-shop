class ProductsController < ApplicationController
  def home
    @products = Product.elastic_search(search_params)
  end

  def show
    @product = Product.find_by_id(params[:id])
    redirect_to root_path if @product.blank?
  end

  private

  def search_params
    params.permit(:type, :page, :query)
  end
end
