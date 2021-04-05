class Coordination < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_many :coordination_items, dependent: :destroy
  accepts_nested_attributes_for :coordination_items
  has_many :comments, dependent: :destroy
  has_many :notifications, dependent: :destroy

  has_one_attached :image

  validates :coordination_title, presence: true

  def create_notification_comment!(current_user, comment_id)
    temp_ids = Comment.select(:user_id).where(coordination_id: id).where.not(user_id: current_user.id).distinct
    temp_ids.each do |temp_id|
      save_notification_comment!(current_user, comment_id, temp_id['user_id'])
    end
    save_notification_comment!(current_user, comment_id, user_id) if temp_ids.blank?
  end

  def save_notification_comment!(current_user, comment_id, visited_id)
    notification = current_user.active_notifications.new(
      coordination_id: id,
      comment_id: comment_id,
      visited_id: visited_id,
      action: 'comment'
    )
    if notification.visitor_id == notification.visited_id
      notification.checked = true
    end
    notification.save if notification.valid?
  end
end
