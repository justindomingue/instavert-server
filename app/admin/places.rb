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

ActiveAdmin.register Place, namespace: :admin, :as => "Recuperateur" do  
  config.sort_order = "name_asc"
  
  controller do
    def create
      params[:recuperateur][:school_id] = current_user.school.id
      create!
    end
  end
  
  index do
    column "Nom", :name do |p| link_to p.name, admin_recuperateur_path(p) end
    column "Matières" do 
      |p| p.products.map { |p| link_to p.name, admin_matiere_path(p) }.join('<br/>').html_safe
    end
    column "Description", :description
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
      row "Nom" do p.name end
      row :tags
      row :description
      row :responsable
      row "Téléphone" do p.telephone end
      row "Courriel" do p.courriel end
      row "Local" do p.local end
      row "Heures" do p.heure end
      row :autre
      row "Matières" do (p.products.map { |product| link_to product.name, admin_matiere_path(product) }.join('<br/>')).html_safe end
    end
  end
    
  form do |f|
    f.inputs "Détails" do
      f.input :name, :label => "Nom"
      # f.input :description, :label => "Descrition"
      # f.input :thumb, :label => "Vignette (URL)"
      f.input :tags
      f.input :description
      f.input :responsable
      f.input :telephone
      f.input :courriel
      f.input :local
      f.input :heure
      f.input :autre
      f.input :products, as: :check_boxes, collection: current_user.school.products, label:"Matières"
    end
    f.actions
  end
  
  sidebar "Explication des champs", :except => :index do
    strong "Nom: "
    span "nom affiché dans l'application."
    br
    strong "Tags: "
    span "mots-clés associés pour étendre la recherche."
    br
    strong "Description: "
    span "au besoin, décrire davantage le récupérateur."
    br
    strong "Responsable: "
    span "le responsable du lieu de récupération."
    br
    strong "Téléphone: "
    span "un numéro de téléphone pour contacter le centre de récupération."
    br
    strong "Courriel: "
    span "comme pour le numéro de téléphone."
    br
    strong "Local: "
    span "si le récupérateur a un local précis dans l'établissement. Ex.: Local 123."
    br
    strong "Heures: "
    span "heures de service du récupérateur, si applicable. Ex.: 8h-15h."
    br
    strong "Autre: "
    span "tout autre information jugée pertinente"
  end
  
  
  sidebar :aide do
    span "Besoin d'aide? Envoyez-nous un courriel à"
    strong "aide@instavert.com"
    span ". Votre administrateur vous répondra sous peu."
  end
end