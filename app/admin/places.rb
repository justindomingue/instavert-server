#!/bin/env ruby
# encoding: utf-8


ActiveAdmin.register Place do
  index do
    column "Nom", :name do |p| link_to p.name, superuser_place_path(p)
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

ActiveAdmin.register Place, namespace: :admin do
  controller do
    def create
      params[:place][:school_d] = current_user.school.id
      create!
    end
  end
  
  index do
    column "Nom", :name do |p| link_to p.name, admin_place_path(p) end
    column "Matières" do 
      |p| p.products.map { |p| link_to p.name, admin_matiere_path(p) }.join('<br/>').html_safe
    end
    # column "Description", :description
    # column :content
    column :tags
    # column "Vignette (URL)", :thumb
    # column "Vues", :views
    default_actions
  end
  
  filter :name, :label => 'par nom'
  filter :description, :label => 'par description'
  filter :tags, :label => 'par tags'
  
  show do |p|
    attributes_table do
      row :name
    end
  end
    
  form do |f|
    f.inputs "Détails" do
      f.input :name, :label => "Nom"
      # f.input :description, :label => "Descrition"
      # f.input :thumb, :label => "Vignette (URL)"
      f.input :tags
      f.input :producte2
    end
    f.actions
  end
  
  sidebar :aide do
    span "Besoin d'aide? Envoyez-nous un courriel à"
    strong "aide@instavert.com"
    span ". Votre administrateur vous répondra sous peu."
  end
end