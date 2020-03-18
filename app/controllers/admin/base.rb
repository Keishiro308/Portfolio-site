class Admin::Base < ApplicationController
  private def current_admin
    if session[:administrator_id]
      @current_admin ||=
        User.find(session[:administrator_id])
    end
  end

  helper_method :current_admin
end