# frozen_string_literal: true

class PublicController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_locale
  layout 'application'

  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
    Rails.application.routes.default_url_options[:locale] = I18n.locale
  end
end
