class CreateShopingCards < ActiveRecord::Migration
  def change
    create_table :shoping_cards do |t|
      t.references :user, index: true, foreign_key: true
      t.string :status

      t.timestamps null: false
    end
  end
end
