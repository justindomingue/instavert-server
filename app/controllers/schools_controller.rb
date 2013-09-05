# encoding: utf-8

class SchoolsController < ApplicationController
  respond_to :json
  
  def index
    if params[:school]
      @school = School.find_by_id params[:school]
      if @school
        respond_with @school, :location => nil
      else
        respond_with School.first, meta: { message:'Établissement introuvable. Base de données par défaut chargée.', error:'No school responds to the given ID (' + params[:school] + ').' }
      end
    else
      respond_with message:"Aucun établissement spécifié.", status:400
    end
  end
end