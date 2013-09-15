#!/bin/env ruby
# encoding: utf-8

ActiveAdmin.register User do
  menu :priority => 2, :label => "Utilisateurs" 
  
  form do |f|
    f.inputs "Détails" do
      f.input :email
      f.input :contact_name
      f.input :phone_number
      f.input :school_name
      f.input :approved
      f.input :subscribed
      f.input :last_4
      f.input :card_type
    end
    f.actions
  end
end
