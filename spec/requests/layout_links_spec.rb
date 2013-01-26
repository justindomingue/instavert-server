require 'spec_helper'

describe "LayoutLinks" do

  describe "for mobile devices" do
    
    describe "should have a Accueil page at '/'" do
      get '/', :format => :mobile
      response.should have_selector('title', :content => "L'Envert")
    end
    
    describe "should have a Astuces page at '/astuces'" do
      get '/astuces', :format => :mobile
      response.should have_selector('title', :content => "Astuces")
    end
    
    describe "should have a Instructions page at '/instructions'" do
      get '/instructions', :format => :mobile
      response.should have_selector('title', :content => "Instructions")
    end
    
    describe "should have a Contacts page at '/contacts'" do
      get '/contacts', :format => :mobile
      response.should have_selector('title', :content => "Contacts")
    end
    
    describe "should have a A Propos page at '/apropos'" do
      get '/apropos', :format => :mobile
      response.should have_selector('title', :content => "A Propos")
    end
    
    describe "should have a Places page at '/lieu'" do
      get '/lieux', :format => :mobile
      response.should have_selector('title', :content => "Lieux")
    end
  end
end
