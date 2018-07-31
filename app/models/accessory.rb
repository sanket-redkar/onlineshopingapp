class Accessory < ActiveRecord::Base

  include Paperclip::Glue
  include ProductAccessoryHelper

  # This function return same price availabe product entry
  def find_same_available_products
    Accessory.availabe.where(modal_id: self.modal_id, price: self.price)
  end

end
