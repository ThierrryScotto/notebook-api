class ApplicationController < ActionController::API

  # using the basic format
  # include ActionController::HttpAuthentication::Basic::ControllerMethods
  # http_basic_authenticate_with name: "thi", password: "pass"
  
  # using the Digest format
  include ActionController::HttpAuthentication::Digest::ControllerMethods
  USERS = { "thi" => Digest::MD5.hexdigest(["thi", "Application", "pass"].join(":"))}

  before_action :authenticate

  def authenticate
    authenticate_or_request_with_http_digest("Application") do |username|
    USERS[username]
    end
  end
end
