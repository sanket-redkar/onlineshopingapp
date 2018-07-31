class UpdateProductDetails < ActiveRecord::Migration
  def change

    remove_column :product_details, :product_id

    change_table :product_details do |t|
      t.string :source_type
      t.integer :source_id, index: true
    end
  end
end
