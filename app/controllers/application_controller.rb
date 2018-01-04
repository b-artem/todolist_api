class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  # before_action :set_locale
  before_action :authenticate_user!, unless: :devise_controller?
  check_authorization unless: :devise_controller?

  before_action :ensure_json_request
  respond_to :json

  rescue_from CanCan::AccessDenied do |exception|
    render nothing: true, status: :forbidden
    # head :forbidden, content_type: 'application/html'
  end

  protected

    def ensure_json_request
      return if request.format == :json || request.headers["Accept"] =~ /json/
      render json: { error: I18n.t('application.unacceptable_request_format') },
             status: 406
    end

    # def set_locale
    #   I18n.locale = request.headers['Accept-Language']
    # end
end
