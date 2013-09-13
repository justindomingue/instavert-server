class WebhooksController < ApplicationController  
  def stripe    
    data = JSON.parse(request.body.read)
    
    AdminMailer.webhook(data).deliver
  end
end
