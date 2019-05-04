class Cart < ApplicationRecord
  has_many :line_items, dependent: :destroy

  scope :pending, -> { where(purchased: false) }

  def calculate_total_price
    line_items.map { |li| li.quantity * li.unit_price }.sum
  end

  def checkout
    return if line_items.blank? || calculate_total_price.blank?

    line_items.includes(:product).each(&:mark_sold!)
    update_attributes(
      total_price: calculate_total_price,
      purchased: true
    )
  end
end
