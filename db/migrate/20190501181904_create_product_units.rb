class CreateProductUnits < ActiveRecord::Migration[5.2]
  def change
    create_table :product_units do |t|
      t.references :product, foreign_key: true
      t.string     :serial_no
      t.date       :bought_on
      t.date       :sold_on

      t.timestamps
    end
  end
end
