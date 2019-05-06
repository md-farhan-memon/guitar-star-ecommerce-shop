class LineItem < ApplicationRecord
  belongs_to :cart
  belongs_to :product

  before_save :validate_quantity

  def total_price
    unit_price * quantity
  end

  def mark_sold!
    product.sold!(quantity)
  end

  private

  def validate_quantity
    self.quantity = if quantity.to_i <= 0
                      1
                    elsif quantity > 10
                      10
                    else
                      quantity
                    end
  end
end
