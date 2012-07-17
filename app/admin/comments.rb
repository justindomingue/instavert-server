#!/bin/env ruby
# encoding: utf-8

ActiveAdmin.register Comment, :as => "Commentaire" do
  index do
    column (:status) { |ticket| status_tag(ticket.status) }
    column "Nom", :name
    column "Courriel", :email
    column "Commentaire", :comment
    default_actions
  end
  
  filter :name, :label => "par nom"
  filter :email, :label => "par courriel"
  filter :status
  
  form do |f|
    f.inputs "Détails" do
      f.input :name, :label => "Nom"
      f.input :email, :label => "Courriel"
      f.input :comment, :label => "Commentaire"
      f.input :status, :as => :radio, :collection => ["Complete", "Ouvert"]
      f.buttons
    end
  end
end
