module ProductAccessoryHelper

  extend ActiveSupport::Concern

  included do
    has_many :product_details, as: :source

    scope :availabe, -> { where(sold_date: nil) }
    scope :search_by_modal_id, ->(value) { where("modal_id LIKE '%#{value}%'")}

    has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/sample.jpg"
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  end

  module ClassMethods
    def search_by(params)
      _products = self.all
      return _products if params.blank?

      params.each do |key, value|
        if !value.blank? && self.respond_to?("search_by_#{key}")
          _products = _products.send("search_by_#{key}", value)
        end
      end
      _products
    end
  end

  module InstanceMethods

  end

  def self.included(receiver)
    receiver.extend         ClassMethods
    receiver.send :include, InstanceMethods
  end
end