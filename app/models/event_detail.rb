class EventDetail < ApplicationRecord
  belongs_to :event
  has_one_attached :image

  with_options presence: true do
    validates :event_heading
    validates :event_description
  end
end
