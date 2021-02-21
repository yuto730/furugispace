class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :following_relationships,foreign_key: "follower_id", class_name: "Relationship",  dependent: :destroy
  has_many :followings, through: :following_relationships
  has_many :follower_relationships,foreign_key: "following_id",class_name: "Relationship", dependent: :destroy
  has_many :followers, through: :follower_relationships

  has_many :community_users, dependent: :destroy
  has_many :communities, through: :community_users
  has_many :messages
  has_many :coordinations
  has_many :comments

  has_one_attached :avatar

  validates :user_nickname, presence: true

  def following?(other_user)
    self.followings.include?(other_user)
  end

  def follow(other_user)
    self.following_relationships.create(following_id: other_user.id)
  end

  def unfollow(other_user)
    self.following_relationships.find_by(following_id: other_user.id).destroy
  end
end
