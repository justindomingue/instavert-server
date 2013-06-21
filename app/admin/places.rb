#!/bin/env ruby
# encoding: utf-8


ActiveAdmin.register Place do
  index do
    column "Nom", :name do |p| link_to p.name, admin_place_path(p)
    end
    column "Matières" do |p| p.products.name end
    column "Description", :description
    column :content
    column :tags
    column "Vignette (URL)", :thumb
    column "Vues", :views
    default_actions
  end
  
  filter :name, :label => 'par nom'
  filter :description, :label => 'par description'
  filter :tags, :label => 'par tags'
  
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
