# app/mailers/devise/mailer.rb
class Devise::Mailer < ApplicationMailer
  include Devise::Controllers::UrlHelpers
  include MailerHelper
  helper :application # This is important to use the ApplicationHelper methods

  # Overwrite the confirmation_instructions method
  def confirmation_instructions(record, token, opts={})
    @confirmation_url = confirmation_url(record, token)
    # super
  end

  private

  def confirmation_url(user, token)
    Rails.application.routes.url_helpers.api_v1_user_confirmation_url(
      confirmation_token: token,
      host: 'localhost',
      port: 3000
    )
  end
end