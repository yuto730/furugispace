class Comment < ApplicationRecord
  belongs_to :coordination
  belongs_to :user
end
