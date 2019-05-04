class CreateCarts < ActiveRecord::Migration[5.2]
  def change
    create_table :carts do |t|
      t.float   :total_price, default: 0.0
      t.boolean :purchased,   default: false

      t.timestamps
    end
  end
end
