module MailerHelper
  # Define a method to generate confirmation URLs
  def confirmation_url(user, token)
    Rails.application.routes.url_helpers.api_v1_user_confirmation_url(
      confirmation_token: token,
      host: 'localhost',
      port: 3000
    )
  end
end