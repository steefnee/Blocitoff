class ApiController < ApplicationController

  skip_before_action :verify_authenticity_token
  skip_before_filter :authenticate_user!
  before_action :authenticated?

  private
  def authenticated?
    authenticate_or_request_with_http_basic {|email, api_token| User.where( email: email, api_token: api_token).present? }
  end
end
