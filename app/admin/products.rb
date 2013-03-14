#!/bin/env ruby
# encoding: utf-8

ActiveAdmin.register Product, :as => "Matiere" do
  index do
    column "Nom", :name, :sortable => :name do |p| link_to p.name, admin_matiere_path(p)
    end
    column :tags
    column "Vues", :views
    column "Lieux" do |lieux|
      lieux.places.each do |p|
        p.name
      end
    end
    default_actions
  end
  
  filter :name, :label => 'par nom'
  filter :tags, :label => 'par tags'
  
  form do |f|
    f.inputs "Détails" do
      f.input :name, :label => "Nom"
      f.input :tags
      f.buttons

      f.has_many :products do |app_f|
        app_f.inputs "Products" do
          if !app_f.object.nil?
            # show the destroy checkbox only if it is an existing appointment
            # else, there's already dynamic JS to add / remove new appointments
            app_f.input :_destroy, :as => :boolean, :label => "Destroy?"
          end

          app_f.input :places # it should automatically generate a drop-down select to choose from your existing patients
        end
  end

    end
  end
end
