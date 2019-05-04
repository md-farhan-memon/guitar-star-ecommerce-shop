module ApplicationHelper
  def cart_quantity
    current_cart.line_items.sum(:quantity)
  end

  def select_type_options
    Product.distinct.pluck(:type).insert(0, 'All')
  end

  def checkout_disabled?
    cart_quantity.zero? ? 'true' : 'false'
  end
end
