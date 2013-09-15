#!/bin/env ruby
# encoding: utf-8

ActiveAdmin.register School, :as => "Ecole" do
  menu :priority => 1, :label => "Écoles"
   
  form do |f|
    f.inputs "Détails" do
      f.input :name, label:'Nom'
      f.input :user, collection: User.all, label:"Utilisateur", member_label: :school_name
    end
    f.actions
  end
end
