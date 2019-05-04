class ProductUnit < ApplicationRecord
  belongs_to :product

  validates_uniqueness_of :serial_no

  scope :in_stock, -> { where(sold_on: nil) }

  before_create :set_serial_no
  after_commit :update_product_quantity

  private

  def set_serial_no
    loop do
      self.serial_no = "GS-#{RandomCodeGenerator.produce}"
      break if valid?
    end
  end

  def update_product_quantity
    product.update_attribute(
      :available_quantity,
      product.product_units.in_stock.count
    )
  end
end
