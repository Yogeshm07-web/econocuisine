# app/models/review.rb
class Review < ApplicationRecord
  belongs_to :user
  belongs_to :product

  after_create :send_review_notification_email

  private

  def send_review_notification_email
    ReviewNotificationMailer.review_notification_email(user).deliver_now
  end
end
