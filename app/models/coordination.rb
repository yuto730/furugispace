class Coordination < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_many :coordination_items, dependent: :destroy
  accepts_nested_attributes_for :coordination_items
  has_many :comments

  has_one_attached :image

  validates :coordination_title, presence: true
end
