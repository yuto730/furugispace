class Comment < ApplicationRecord
  belongs_to :coordination
  belongs_to :user

  has_many :notifications, dependent: :destroy
end
