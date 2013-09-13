class WebhooksController < ApplicationController  
  def stripe
    data = JSON.parse(request.body.read)
    puts data
    # puts "Received event with ID : #{data[:id]} and Type: #{data[:type]}"
    # event = Stripe::Event.retrieve(data[:id])
    # puts event
  end
end
