class ReviewNotificationMailer < ApplicationMailer
    def review_notification_email(user)
      @user = user
      mail(to: @user.email, subject: 'Your review has been saved')
    end
  end