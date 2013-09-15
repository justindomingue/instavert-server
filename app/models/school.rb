#!/bin/env ruby
# encoding: utf-8

class School < ActiveRecord::Base
  attr_accessible :name, :user_id
  after_create :create_default
  
  has_many :products
  has_many :places
  belongs_to :user
  
  def create_default
    Product.create name:'Supprimez-moi après après avoir ajouter une première matière.', category:'Autre', school_id:self.id  
    Place.create name:'Supprimez-moi après après avoir ajouter un premier récupérateur.', responsable:'Jean Valjean', telephone:'555 123-4567', courriel:'example@instavert.com', local:'B-317', heure:'8h-15h', school_id:self.id
  end
end

