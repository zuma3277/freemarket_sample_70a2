class ApplicationController < ActionController::Base
  # Basic認証のbeforeアクション ifで本番環境かそうでないかの確認をしている
  before_action :basic_auth, if: :production?
  protect_from_forgery with: :exception

  private
  # Basic認証を確認するためのメソッド
  def production?
    Rails.env.production?
  end
  # Basic認証のメソッド
  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end

end
