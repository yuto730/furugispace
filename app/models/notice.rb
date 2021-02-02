class Notice < ApplicationRecord
  with_options presence: true do
    validates :notice_title
    validates :notice_display
    validates :notice_heading
    validates :notice_description
  end
  has_one_attached :image
  has_one_attached :thumbnail
  belongs_to :store
end
