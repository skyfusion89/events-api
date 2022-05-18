class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods
  before_action :authenticate

  protected

  def authenticate
    @current_application = AccessToken.find_by_access_id(request.headers['HTTP_CLIENTID'])
    render_unauthorized unless authenticate_token
  end

  def authenticate_token
    authenticate_with_http_token do |token, options|
      return false unless @current_application

      @current_application.client_token == token
    end
  end

  def render_unauthorized(realm = "Application")
    errors = {}
    self.headers["WWW-Authenticate"] = %Q(Token realm="#{realm.delete('"')}")
    errors[:message] = "Unauthorized"
    render json: errors, status: :unauthorized
  end
end
