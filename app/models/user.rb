class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :communities, through: :community_users
  has_many :coordinations
  has_many :comments
  has_many :community_users

  validates :user_nickname, presence: true
end
