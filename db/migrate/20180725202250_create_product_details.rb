class CreateProductDetails < ActiveRecord::Migration
  def change
    create_table :product_details do |t|
      t.integer :model_id
      t.references :product, index: true, foreign_key: true
      t.float :price
      t.references :shoping_card, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
