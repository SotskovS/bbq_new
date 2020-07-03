class Subscription < ApplicationRecord
  belongs_to :event
  belongs_to :user, optional: true

  validates :event, presence: true

  validates :user_name, presence: true, unless: -> { user.present? }
  validates :user_email, presence: true, format: /[\w\.]+@[\w\.]+/, unless: -> { user.present? }

  validates :user, uniqueness: { scope: :event_id }, if: -> { user.present? }
  validates :user_email, uniqueness: { scope: :event_id }, unless: -> { user.present? }

  validate :user_event?, on: :create, if: -> { user.present? }
  validate :user_email_exist?, on: :create, unless: -> { user.present? }

  def user_name
  	if user.present?
  		user.name
  	else
  		super
  	end
  end

  def user_email
  	if user.present?
  		user.email
  	else
  		super
  	end
  end

  private

  def user_event?
    if user_id == event.user_id
      errors.add(:user, I18n.t('errors.user_event'))
    end
  end

  def user_email_exist?
    if User.find_by(email: user_email)
      errors.add(:user_email, I18n.t('errors.user_email_exist'))
    end
  end
end
