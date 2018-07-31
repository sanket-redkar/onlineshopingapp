class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :serial_number
      t.attachment :image
      t.string :modal_id
      t.integer :strings
      t.float :price
      t.text :description
      t.string :type
      t.date :bought_date
      t.date :sold_date

      t.references :brand, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
