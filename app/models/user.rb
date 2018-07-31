class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :shoping_cards

  ROLES = %i(admin user)

  ROLES.each do |role_name|
    define_method("#{role_name}?"){ self.role == role_name.to_s }
  end
end
