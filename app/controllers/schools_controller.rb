# encoding: utf-8

class SchoolsController < ApplicationController
  respond_to :json
  
  def index
    if params[:school]
      @school = School.find_by_id params[:school]
      if @school
        respond_with @school
      else
        respond_with School.first, meta: { message:'Établissement introuvable. Base de données par défaut chargée.', error:'No school responds to the given ID (' + params[:school] + ').' }
      end 
    elsif params[:version] == 'true'
      last_edited_product = Product.order('updated_at').last.updated_at.to_i
      last_edited_place = Place.order('updated_at').last.updated_at.to_i
      version = last_edited_product > last_edited_place ? last_edited_product : last_edited_place
      render json:{ version:version}
    else
      respond_with message:"Aucun établissement spécifié.", status:400
    end
  end
  
end