class Notice < ApplicationRecord
  belongs_to :store
  has_many :notice_details, dependent: :destroy
  accepts_nested_attributes_for :notice_details
  has_one_attached :thumbnail

  with_options presence: true do
    validates :notice_title
    validates :notice_display
  end
end
