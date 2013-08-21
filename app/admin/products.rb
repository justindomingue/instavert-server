#!/bin/env ruby
# encoding: utf-8

ActiveAdmin.register Product, :as => "Matiere" do
  index do
    column "Nom", :name, :sortable => :name do |p| link_to p.name, superuser_matiere_path(p)
    end
    column "Lieux" do |p| p.places.name end
    column :tags
    column "Établissement", :school
    column "Vues", :views
    default_actions
  end
  
  filter :name, :label => 'par nom'
  filter :tags, :label => 'par tags'
  
  form do |f|
    f.inputs "Détails" do
      f.input :name, :label => "Nom"
      f.input :tags
      f.buttons
    end
  end
end
