class ShopingCard < ActiveRecord::Base

  include AASM

  belongs_to :user

  has_many :product_details

  has_many :gitar_details, -> { where(source_type: 'Product') }, class_name: 'ProductDetail', primary_key: :id

  has_many :accessory_details, -> { where(source_type: 'Accessory') }, class_name: 'ProductDetail', primary_key: :id

  has_many :gitars, through: :gitar_details, source: :gitar
  has_many :accessories, through: :accessory_details, source: :accessory

  accepts_nested_attributes_for :product_details


   aasm column: :status do
    state :cooking, :initial => true
    state :processing
    state :paid

    event :process, after: :make_payment do
      transitions from: :cooking, to: :processing
    end

    event :paid do
      transitions from: :processing, to: :paid
    end
  end


  def make_payment
    ShopingCard.transaction do
      # if payment successfull
      self.gitars.update_all(sold_date: Date.today)
      self.accessories.update_all(sold_date: Date.today)
      self.paid!
    end
  end
end
