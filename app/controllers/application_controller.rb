class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_mobile_format
  
  private
  
  def mobile_device?
    request.user_agent =~ /Mobile|webOS/
  end
  helper_method :mobile_device?
  
  def set_mobile_format
    if mobile_device?
      request.format = :mobile
    end
  end
end
