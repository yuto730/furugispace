class Coordination < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :item
  has_many      :items, dependent: :destroy
  accepts_nested_attributes_for :items, allow_destroy: true

  belongs_to :user
  has_many :comments

  has_one_attached :image

  with_options presence: true do
    validates :coordination_title
    validates :item_id
    validates :item_text
  end

  validates :item_id, numericality: { other_than: 1 }
end
