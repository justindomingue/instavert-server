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
  
  def recherche
    if params[:recherche] == nil
      redirect_to root_path
    else
      @title = "Recherche"
      search = params[:recherche]
      @products = Product.search_products(search)
      @places   = Place.search_places(search)
      if @products.empty?
        Search.create!(@products)
      elsif @places.empty?
        Search.create!(@places)
      end
    end
  end
end
