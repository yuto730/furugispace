class Message < ApplicationRecord
  belongs_to :user
  belongs_to :community

  has_one_attached :image

  validates :content, presence: true

  # createの後にコミットする { MessageBroadcastJobのperformを遅延実行 引数はself }
  after_create_commit { MessageBroadcastJob.perform_later self }
end
