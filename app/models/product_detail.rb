class ProductDetail < ActiveRecord::Base
  belongs_to :source, polymorphic: true

  belongs_to :gitar, primary_key: :id, foreign_key: :source_id, class_name: 'Product'

  belongs_to :accessory, primary_key: :id, foreign_key: :source_id, class_name: 'Accessory'

  validates_uniqueness_of :source_id, scope: [:shoping_card_id, :source_type]
end
