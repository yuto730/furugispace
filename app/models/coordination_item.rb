class CoordinationItem < ApplicationRecord
  belongs_to_active_hash :item
  belongs_to :coordination

  with_options presence: true do
    validates :item_id
    validates :item_text
  end

  validates :item_id, numericality: { other_than: 1 }
end
