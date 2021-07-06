class ApplicationController < ActionController::API

  TOKEN = "a5c1ca754f514579c5fe31ae6c5d264f"

  include ActionController::HttpAuthentication::Token::ControllerMethods

  before_action :authenticate

  private
  def authenticate
    authenticate_or_request_with_http_token do |token, options|
      ActiveSupport::SecurityUtils.secure_compare(
        ::Digest::SHA256.hexdigest(token),
        ::Digest::SHA256.hexdigest(TOKEN)
      )
    end
  end
end
