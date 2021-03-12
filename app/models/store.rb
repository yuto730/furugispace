class Store < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :notices
  has_many :events

  has_one_attached :avatar

  with_options presence: true do
    validates :store_nickname
    validates :address
    validates :phone_number
  end
end
