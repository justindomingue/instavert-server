class WebhooksController < ApplicationController  
  def stripe
    Stripe.api_key = ENV['STRIPE_SECRET_KEY']
    
    data = JSON.parse(request.body.read)
    puts data
    puts data["id"]
    puts "Received event with ID : #{data["id"]} and Type: #{data["type"]}"
    event = Stripe::Event.retrieve(data["id"])
    puts event
  end
end
