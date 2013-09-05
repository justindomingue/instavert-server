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

ActiveAdmin.register Product, :as => "Matiere", namespace: :admin do
  controller do
    def create
      params[:matiere][:school_d] = current_user.school.id
      create!
    end
  end
  
  index do
    column "Nom", :name, :sortable => :name do |p| link_to p.name, admin_matiere_path(p)
    end
    column "Lieux" do |p|
      p.places.map { |p| p.name }.join('<br />').html_safe
    end
    column :tags
    # column "Vues", :views
    default_actions
  end
  
  filter :name, :label => 'par nom'
  filter :tags, :label => 'par tags'
  
  form do |f|
    f.inputs "Détails" do
      f.input :name, :label => "Nom"
      f.input :tags
      f.input :places, as: :check_boxes, collection: current_user.school.places, label:"Récupérateur(s)"
    end
    f.actions
  end
  
  sidebar :aide do
    span "Besoin d'aide? Envoyez-nous un courriel à"
    strong "aide@instavert.com"
    span ". Votre administrateur vous répondra sous peu."
  end
end
