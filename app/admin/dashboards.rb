#!/bin/env ruby
# encoding: utf-8

ActiveAdmin::Dashboards.build do
  
  section "Recherches récentes", priority:1 do
    table_for Search.order("created_at desc").limit(5) do
      column "Nom", :name do |product|
        link_to product.name, admin_matiere_path(product)
      end
    end
    strong { link_to "Voir toutes les Recherches", admin_recherches_path }
  end

  section "Produits récents", priority:2 do
    table_for Product.order("created_at desc").limit(5) do
      column "Nom", :name do |product|
        link_to product.name, admin_matiere_path(product)
      end
    end
    strong { link_to "Voir tous les Produits", admin_matieres_path }
  end

  section "Places récentes" do
    table_for Place.order("created_at desc").limit(5) do
      column "Nom", :name do |place|
        link_to place.name, admin_place_path(place)
      end
    end
    strong { link_to "Voir toutes les Places", admin_places_path }
  end
  section "Commentaires récents", :priority => 1 do
    table_for Comment.order("created_at desc").limit(5) do
      column("Status") { |ticket| status_tag(ticket.status) }
      column("Nom", :name)   { |h| link_to h.name, [:admin, h] }
      column("Commentaire", :comment) 
    end
    strong { link_to "Voir tous les Commentaires", admin_comments_path }
  end
end
