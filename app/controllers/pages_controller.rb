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
      @recherche = ThinkingSphinx.search params[:search], :class => [Product, Place],
                                                        :match_mode => :any,
                                                        :order => 'class_crc ASC'
    end
  end
end
