#!/bin/env ruby
# encoding: utf-8

ActiveAdmin.register_page "Dashboard" do
  menu :priority => 1, :label => "Tableau de bord" 
  
  content do
    columns do
      column do
        panel "Utilisateurs" do
          table_for User.order("created_at desc").limit(5) do |u|
            
            u.column "Nom", :name do |u|
              link_to u.contact_name, superuser_user_path(u)
            end
            u.column "Établissement", :school_name
            u.column("Statut") do |u|
              status_tag (u.approved ? "Approuvé" : "En attente"), (u.approved ? :ok : :error)
            end
            u.column("Abonnement") do |u|
              status_tag (u.subscribed ? "Abonné" : "non"), (u.subscribed ? :ok : :error)
            end
            
            
          end
          strong { link_to "Voir tous les Utilisateurs", superuser_users_path }
        end
      end
      
      column do
        panel "Établissements" do
          table_for School.order("created_at desc").limit(5) do
            column "Nom", :name do |s|
              link_to s.name, superuser_ecole_path(s)
            end
          end
          strong { link_to "Voir toutes les Établissements", superuser_ecoles_path }
        end
      end
    end
    
    columns do
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
    end
  end
end

ActiveAdmin.register_page "Dashboard", namespace: :admin do
  menu :priority => 1, :label => "Tableau de bord"
  
  content do
    columns do
      column do
        panel "Vos Dernières Matières" do
          table_for current_user.school.products.order("created_at desc").limit(5) do |p|
            p.column "Nom", :name do |product|
              link_to product.name, admin_matiere_path(product)
            end
          end
          strong { link_to "Voir tous les Produits", admin_matieres_path }
        end
      end
      
      column do
        panel "Vos Derniers Récupérateurs" do
          table_for current_user.school.places.order("created_at desc").limit(5) do
            column "Nom", :name do |place|
              link_to place.name, admin_recuperateur_path(place)
            end
          end
          strong { link_to "Voir toutes les Places", admin_recuperateurs_path }
        end
      end
    end
  end
end