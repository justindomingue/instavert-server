#!/bin/env ruby
# encoding: utf-8

class SubscriptionsController < ApplicationController  
  skip_before_filter :verify_authenticity_token
  before_filter :authenticate_user!
  before_filter :subscribed?, only:['active', 'cancel']
  
  def new
    @user = current_user
  end
  
  def active
    @user = current_user
    @customer = Stripe::Customer.retrieve(@user.stripe_id)
    # @user["trial_end_date"] = (@customer["subscription"]["trial_end"]).to_s(:long)
  end
  
  def create
    # Get the credit card details submitted by the form
    token = params[:stripeToken]
    coupon = params[:coupon]
      
    # Create a Customer
    customer = Stripe::Customer.create(
      :card => token,
      :plan => "basic",
      :email => current_user.email,
      :coupon => coupon
    )
      
    current_user.stripe_id = customer.id
    current_user.last_4 = customer['cards']['data'][0]['last4']
    current_user.card_type = customer['cards']['data'][0]['type']
    current_user.subscribed = true
      
    if current_user.save
      redirect_to active_subscription_path, notice:'Abonnement réussi. Vous carte sera automatiquement chargée à la fin de la période d\'essai de sept (7) jours).'
    else
      redirect_to new_subscription_path, error:"Une erreur est survenue lors de l'activation de l'enregistrement"
    end


  rescue Stripe::CardError => e
    logger.error e.message
    sendAdminErrorMessage(current_user, e.message)
    flash[:error] = "Il y a un problème avec votre carte de crédit."
    render :action => :new

  rescue Stripe::StripeError => e
    sendAdminErrorMessage(current_user, e.message)
    logger.error e.message
    flash[:error] = "Notre processeur de paiement a rencontré une erreur avec votre carte de crédit."
    render :action => :new
  end
  
  
  def cancel
    if current_user.valid_password?(params[:password])
      cu = Stripe::Customer.retrieve(current_user.stripe_id)
      cancel = cu.cancel_subscription
      cu.delete
    
      if cancel.status == 'canceled'
        current_user.stripe_id = nil
        current_user.last_4 = nil
        current_user.card_type = nil
        current_user.subscribed = false
        current_user.save
        redirect_to root_path, notice:'Abonnement annulé et carte de crédit supprimée.'
      else
        redirect_to active_subscription_path, alert:'Une erreur est survenue lors de l\'annulation de votre abonnement.'
      end
    else
      redirect_to active_subscription_path, alert:'Mot de passe invalide.'
    end
  end
end
