class PlacesController < ApplicationController
  before_filter :authenticate, :only => [:new, :edit, :destroy]
  before_filter :increment_views, :only => [:show]
  
  def index
    @title = 'Lieux'
    @places = Place.order(:name)
  end
  
  def show
    @place = Place.find(params[:id])
    @title = @place.name
  end
  
  def new
    @place = Place.new
    @title = "Ajouter"
  end
  
  def create
    @place = Place.new(params[:place])
    if @place.save
      redirect_to places_path, :flash => { :success => "Lieu ajoute." }
    else
      @title = "Ajouter"
      render 'new'
    end
  end
  
  def destroy
    Place.find(params[:id]).destroy
    flash[:success] = "Lieu detruit."
    redirect_to places_path
  end
  
  protected
    
  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
    username == "foo" && password = "bar"
    end
  end
  
  def increment_views
    @place = Place.find(params[:id])
    @place.increment!(:views)
  end
end
