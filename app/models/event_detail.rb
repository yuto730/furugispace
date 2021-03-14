class EventDetail < ApplicationRecord
  belongs_to :event

  with_options presence: true do
    validates :event_heading
    validates :event_description
  end
end
