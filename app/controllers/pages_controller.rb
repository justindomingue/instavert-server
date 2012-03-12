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
    if params[:search] == nil
      redirect_to root_path
    else
      @title = "Recherche"
      search = params[:search]
      @products_by_name = search_products_by_name(search)
      @products_by_tags = search_products_by_tags(search)
      @places_by_name   = search_places_by_name(search)
      @placess_by_tags  = search_places_by_tags(search)
    end
  end
end
