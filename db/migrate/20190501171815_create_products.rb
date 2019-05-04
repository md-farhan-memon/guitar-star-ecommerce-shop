class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string     :type
      t.string     :name
      t.string     :brand
      t.string     :model
      t.integer    :number_of_strings,  default: 0
      t.integer    :available_quantity, default: 0
      t.float      :price,              default: 0.0
      t.boolean    :published,          default: false
      t.references :category,           foreign_key: true

      t.timestamps
    end
  end
end
