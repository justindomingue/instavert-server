#!/bin/env ruby
# encoding: utf-8

class SubscriptionsController < ApplicationController  
  skip_before_filter :verify_authenticity_token
  
  def new
    @email = current_user.email
  end
  
  def create
    # Get the credit card details submitted by the form
    token = params[:stripeToken]
    
    if user = User.find_by_email(params[:email])
  
      # Create a Customer
      customer = Stripe::Customer.create(
        :card => token,
        :plan => "basic_notrial",
        :email => user.email
      )
    
      puts customer
    
      puts customer.id
      user.stripe_id = customer.id
      user.last_4 = customer['cards']['data'][0]['last4']
      user.card_type = customer['cards']['data'][0]['type']
      user.subscribed = true
    
      if user.save
        puts user.stripe_id
        date = Date.today + 7
        redirect_to root_path, notice:'Abonnement réussi. Vous carte sera automatiquement chargée à la fin de la période d\'essai (dans sept jours).'
      else
        redirect_to new_subscription_path, error:"Une erreur est survenue lors de l'activation de l'enregistrement"
      end
    else
      redirect_to new_subscription_path, error:"Votre compte n'a pas été trouvé. Veuillez réessayer ou contacter votre administrateur."
    end
    
  rescue Stripe::CardError => e
    logger.error e.message
    sendAdminErrorMessage(user, e.message)
    flash[:error] = "Il y a un problème avec votre carte de crédit."
    render :action => :new

  rescue Stripe::StripeError => e
    sendAdminErrorMessage(user, e.message)
    logger.error e.message
    flash[:error] = "Notre processeur de paiement a rencontré une erreur avec votre carte de crédit."
    render :action => :new
  end
end
