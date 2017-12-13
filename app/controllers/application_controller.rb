class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  # before_action :set_locale
  # before_action :authenticate_user!
  before_action :ensure_json_request

  protected

    def ensure_json_request
      return if request.format == :json || request.headers["Accept"] =~ /json/
      render nothing: true, status: 406
    end

    # def set_locale
    #   I18n.locale = request.headers['Accept-Language']
    # end
end
