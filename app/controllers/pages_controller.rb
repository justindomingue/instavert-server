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
    favoris = Search.all
    freq = favoris.inject(Hash.new(0)) { |h,v| h[v.name] += 1; h }
    sort_list = favoris.sort_by { |v| freq[v] }.uniq
    @favoris = sort_list[-5..-1]
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