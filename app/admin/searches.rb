#!/bin/env ruby
# encoding: utf-8


ActiveAdmin.register Search do
  index do
    column "Nom", :name do |p| link_to p.name, admin_place_path(p)
    end
    column "Enregistré?", :presence
    column "Date de recherche", :created_at
    default_actions
  end
  
  filter :name, :label => 'par nom'
  filter :presence, :label => 'par présence', :as => :check_boxes
  
  form do |f|
    f.inputs "Détails" do
      f.input :name, :label => "Nom"
      f.input :description, :label => "Descrition"
      f.input :thumb, :label => "Vignette (URL)"
      f.input :tags
      f.buttons
    end
  end
end
