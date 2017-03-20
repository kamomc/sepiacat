class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :auth unless Rails.env.development?

  private
  def auth
    authenticate_or_request_with_http_basic('Login') do |n, p|
      n == ENV["BASIC_AUTH_USER"] && p == ENV["BASIC_AUTH_PASSWORD"]
    end
  end
end
