class EventMailer < ApplicationMailer

  def subscription(event, subscription)
    @email = subscription.user_email
    @name = subscription.user.name
    @event = event

    mail to: event.user.email, subject: "Новая подписка на #{event.title}"
  end

  def comment(event, comment, emeil)
    @comment = comment
    @event = event

    mail to: event.user.email, subject: "Новай комментарий @#{event.title}"
  end
end
