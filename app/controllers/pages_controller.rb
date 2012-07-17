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
  
  def favoris
    @title = "Favoris"
    @favorite_products = Product.order("views desc").first(5)
    @favorite_places   = Place.order("views desc").first(5)
  end
  
  def recherche
    @title = "Recherche"
    unless params[:recherche] == nil
      @products = Product.search_products(params[:recherche])
      @places   = Place.search_places(params[:recherche])
      search = Search.new(:name => params[:recherche], 
                          :presence => (@products.empty? && @places.empty?)? false : true )
      search.save
    end
  end
  
  def statistiques
    @title = 'Statistiques'
  end
  
  def commentaires
    @title = 'Commentaires'
  end
end