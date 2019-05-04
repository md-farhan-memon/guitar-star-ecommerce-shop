class LineItem < ApplicationRecord
  belongs_to :cart
  belongs_to :product

  def total_price
    unit_price * quantity
  end

  def mark_sold!
    product.sold!(quantity)
  end
end
