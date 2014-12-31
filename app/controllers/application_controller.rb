class ApplicationController < ActionController::Base
  before_action :make_search
  before_action :require_login
  include Monban::ControllerHelpers
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def make_search
    @search = Search.new
  end
end
