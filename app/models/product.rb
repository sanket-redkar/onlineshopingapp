class Product < ActiveRecord::Base
  include Paperclip::Glue
  include ProductAccessoryHelper

  belongs_to :brand



  scope :search_by_brand_id, ->(value){ where("brand_id LIKE ? " =>  "%#{value}%")}
  scope :search_by_brand_name, ->(value){ includes(:brand).where("brands.name LIKE ?" =>  "%#{value}%" )}


  delegate :name, to: :brand, prefix: true, allow_nil: true

  # This function return same price availabe product entry
  def find_same_available_products
    Product.availabe.where(modal_id: self.modal_id, price: self.price, brand_id: self.brand_id)
  end
end
