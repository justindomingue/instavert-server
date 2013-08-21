#!/bin/env ruby
# encoding: utf-8

ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, :label => "Dashboard" 
  
  content do
    columns do
      column do
        panel "Recherches récentes" do
          table_for Search.order("created_at desc").limit(5) do |r|
            r.column "Nom", :name do |product|
              link_to product.name, superuser_matiere_path(product)
            end
          end
          strong { link_to "Voir toutes les Recherches", superuser_recherches_path }
        end
      end
      
      column do
        panel "Produits récents" do
          table_for Product.order("created_at desc").limit(5) do |p|
            p.column "Nom", :name do |product|
              link_to product.name, superuser_matiere_path(product)
            end
          end
          strong { link_to "Voir tous les Produits", superuser_matieres_path }
        end
      end
      
      column do
        panel "Places récentes" do
          table_for Place.order("created_at desc").limit(5) do
            column "Nom", :name do |place|
              link_to place.name, superuser_place_path(place)
            end
          end
          strong { link_to "Voir toutes les Places", superuser_places_path }
        end
      end
      
      column do
        panel "Commentaires récents", :priority => 1 do
          table_for Comment.order("created_at desc").limit(5) do
            column("Status") { |ticket| status_tag(ticket.status) }
            column("Nom", :name)   { |h| link_to h.name, [:superuser, h] }
            column("Commentaire", :comment) 
          end
          strong { link_to "Voir tous les Commentaires", superuser_comments_path }
        end
      end
    end
  end
end
