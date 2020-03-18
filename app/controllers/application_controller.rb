class ApplicationController < ActionController::Base
  layout :set_layout

  private def set_layout
    if params[:controller].match(%r{\A(visitor|admin)/})
      Regexp.last_match[1]
    else
      'visitor'
    end
  end
end
