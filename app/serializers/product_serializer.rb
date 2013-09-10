#!/bin/env ruby
# encoding: utf-8

class ProductSerializer < ActiveModel::Serializer
  embed :ids
  attributes :id, :name, :tags, :category, :color
  attribute :category, key: :thumb
  
  has_many :places
  
  def category
    case object.category
    when 'Contenant'
     'icon-glass'
    when 'Électronique'
     'icon-desktop'
    when 'Lumière'
      'icon-lightbulb'
    when 'Maison'
      'icon-home'
    when 'Matériel de bureau'
      'icon-paper-clip'
    when 'Matériaux de construction'
      'icon-wrench'
    when 'Nourriture'
     'icon-food'
    when 'Papier'
     'icon-file-alt'
    when 'Santé'
     'icon-h-sign'
    when 'Vêtement'
     'icon-female'
    else
      ''
    end
  end
  
  def color
    rand(1..8)
  end
end
