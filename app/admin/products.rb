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
  config.sort_order = "name_asc"
  
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
      p.places.map { |p| link_to p.name, admin_recuperateur_path(p) }.join('<br />').html_safe
    end
    column :tags
    column "Catégorie", :category
    default_actions
  end
  
  filter :name, :label => 'par nom'
  filter :tags, :label => 'par tags'
  
  show do |p|
    attributes_table do
      row "Nom" do p.name end
      row :tags
      row "Catégorie" do p.category end
      row "Récupérateurs" do (p.places.map { |place| link_to place.name, admin_recuperateur_path(place) }.join('<br/>')).html_safe end
    end
  end
    
    
  form do |f|
    f.inputs "Détails" do
      f.input :name, :label => "Nom"
      f.input :tags
      f.input :category,label:'Catégorie', as: :radio, collection:['Contenant', 'Électronique', 'Lumière', 'Maison', 'Matériaux de construction', 'Matériel de bureau', 'Nourriture', 'Papier', 'Santé', 'Vêtement', 'Autre']
      f.input :places, as: :check_boxes, collection: current_user.school.places, label:"Récupérateurs"
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
    strong "Catégorie: "
    span "spécifie l'image à afficher pour chaque matière (l'utilisateur "
    strong "ne verra pas "
    span "la catégorie)."
    br
    strong "Récupérateurs: "
    span "spéciifie au moins un lieu de récupération de la matière."
  end
  
  sidebar :aide do
    span "Besoin d'aide? Envoyez-nous un courriel à"
    strong "aide@instavert.com"
    span ". Votre administrateur vous répondra sous peu."
  end
end
