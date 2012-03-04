class PagesController < ApplicationController
  def accueil
    @title = "L'Envert"
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
end
