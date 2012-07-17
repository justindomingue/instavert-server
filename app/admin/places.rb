#!/bin/env ruby
# encoding: utf-8


ActiveAdmin.register Place do
  index do
    column "Nom", :name do |p| link_to p.name, admin_place_path(p)
    end
    column "Description", :content
    column :tags
    column "Image", :img
    column "Vues", :views
    default_actions
  end
  
  filter :name, :label => 'par nom'
  filter :content, :label => 'par contenu'
  filter :tags, :label => 'par tags'
  
  form do |f|
    f.inputs "Détails" do
      f.input :name, :label => "Nom"
      f.input :content, :label => "Contenu"
      f.input :tags
      f.buttons
    end
  end
end
