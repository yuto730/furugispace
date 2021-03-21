class NoticeDetail < ApplicationRecord
  belongs_to :notice
  has_one_attached :image

  with_options presence: true do
    validates :notice_heading
    validates :notice_description
  end
end
