class Community < ApplicationRecord
  belongs_to :user
  has_many :community_users
  has_many :users, through: :community_users

  has_one_attached :image

  with_options presence: true do
    validates :community_title
  end
end
