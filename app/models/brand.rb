class Brand < ActiveRecord::Base

  has_many :products
  has_many :sold_products, ->{ where.not(sold_date: nil) }, class_name: 'Product'
  has_many :available_products, -> { where(sold_date: nil) }, class_name: 'Product'

end
