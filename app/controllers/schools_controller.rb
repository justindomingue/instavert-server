class SchoolsController < ApplicationController
  respond_to :json
  
  def index
    if params[:school]
      @school = School.find_by_id params[:school]
      if @school
        respond_with @school
      else
        respond_with error:'No school responds to the given ID (' + params[:school] + ').', status:404
      end
    else
      respond_with error:'No school provided', status:400
    end
  end
end