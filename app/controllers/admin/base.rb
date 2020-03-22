class Admin::Base < ApplicationController
  before_action :authenticate

  private def authenticate
    unless current_admin
      redirect_to :admin_login
    end
  end

  private def current_admin
    if session[:administrator_id]
      @current_admin ||=
        User.find(session[:administrator_id])
    end
  end

  helper_method :current_admin
end