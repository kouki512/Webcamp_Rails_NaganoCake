class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
 with_options presence: true do
    validates :last_name
    validates :first_name
    validates :first_name_furigana
    validates :last_name_furigana
    validates :postal_code
    validates :address
    validates :phone_number
    validates :email
end

  has_many :cart_items
  
end
