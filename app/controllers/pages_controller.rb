class PagesController < ApplicationController
  def accueil
    @title = "Accueil"
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

end
