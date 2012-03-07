class PagesController < ApplicationController
  def accueil
    @title = "L'Envert"
    @places_count   = Place.count
    @products_count = Product.count
  end

  def astuces
    @title = "Astuces"
  end

  def instructions
    @title = "Instructions"
  end

  def contacts
    @title = "Contacts"
  end
  
  def apropos
    @title = "A Propos"
  end
  
  def admin
    authenticate
    @title = "Admin"
    @products = Product.all
    @places   = Place.all
  end
  
  protected
    
  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
    username == "foo" && password = "bar"
    end
  end
end
