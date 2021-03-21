class Event < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :store
  has_many :event_details, dependent: :destroy
  accepts_nested_attributes_for :event_details
  has_one_attached :thumbnail

  with_options presence: true do
    validates :event_title
    validates :event_display
    validates :start_on
    validates :end_on
    validates :entry_fee
    validates :event_address
    validates :venue
  end
  validates :prefecture_id, numericality: { other_than: 1 }
end
