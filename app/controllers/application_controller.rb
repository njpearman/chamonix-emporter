class ApplicationController < ActionController::Base
  around_action :set_locale

  private

  def default_url_options
    { locale: I18n.locale }
  end

  def set_locale(&action)
    I18n.with_locale(params[:locale] || I18n.default_locale, &action)
  end
end
