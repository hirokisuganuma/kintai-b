class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  include WorksHelper
  def top
    @user = User.find(1)
  end
end