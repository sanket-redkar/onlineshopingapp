class CreateAccessories < ActiveRecord::Migration
  def change
    create_table :accessories do |t|
      t.string :serial_number
      t.string :name
      t.attachment :image
      t.string :modal_id
      t.string :data
      t.float :price
      t.text :description
      t.date :bought_date
      t.date :sold_date

      t.timestamps null: false
    end
  end
end
