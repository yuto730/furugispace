class Community < ApplicationRecord

  belongs_to :store
  belongs_to :user

  with_options presence: true do
    validates :community_title
  end
end
