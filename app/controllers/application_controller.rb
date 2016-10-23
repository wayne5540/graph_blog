class ApplicationController < ActionController::Base
  include Clearance::Controller
  protect_from_forgery with: :null_session

  private

  def authenticate_by_api_token!
    authenticate_or_request_with_http_token do |token, _|
      user = User.find_by_api_token(token)
      sign_in(user)
      user
    end
  end
end
