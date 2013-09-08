#!/bin/env ruby
# encoding: utf-8

class ApplicationController < ActionController::Base
  protect_from_forgery
    
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end
  
  def subscribed?
    unless current_admin_user
      if !current_user.subscribed
        redirect_to new_subscription_path, alert:"Vous n'êtes pas encore abonné."
      end
    end
  end
  
  def after_sign_in_path_for(resource)
    if current_admin_user
      superuser_dashboard_path
    else
      admin_dashboard_path
    end
  end
  
  def after_sign_up_path_for(resource)
    if current_user
      admin_dashboard_path
    end
  end
  
  def after_sign_out_path_for(resource)
    root_path
  end
  
  def sendAdminErrorMessage(user, message)
    AdminMailer.subscription_error(user, message).deliver
  end
end
