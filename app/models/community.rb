class Community < ApplicationRecord
  has_many :community_users, dependent: :destroy
  has_many :users, through: :community_users
  has_many :messages, dependent: :destroy

  has_one_attached :image

  validates :community_title, presence: true
end
