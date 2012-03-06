require 'spec_helper'

describe PagesController do
  render_views
  
  describe "GET 'accueil'" do
    it "should be successful" do
      get 'accueil'
      response.should be_success
    end
    
    it "should have the right title" do
      get 'accueil'
      response.should have_selector("title", :content => "L'Envert")
    end
    
    describe "for mobile device" do
      it "should render the mobile view" do
        get 'accueil', :format => :mobile
        response.should have_selector("div", "data-role" => "page")
      end
    end
  end
  
  describe "GET 'astuces'" do
    it "should be successful" do
      get 'astuces'
      response.should be_success
    end
    
    it "should have the right title" do
      get 'astuces'
      response.should have_selector("title", :content => "Astuces")
    end
  end
  
  describe "GET 'instructions'" do
    it "should be successful" do
      get 'instructions'
      response.should be_success
    end
    
    it "should have the right title" do
      get 'instructions'
      response.should have_selector("title", :content => "Instructions")
    end
  end
  
  describe "GET 'contacts'" do
    it "should be successful" do
      get 'contacts'
      response.should be_success
    end
    
    it "should have the right title" do
      get 'contacts'
      response.should have_selector("title", :content => "Contacts")
    end
  end
  
  describe "GET 'apropos'" do
    it "should be successful" do
      get 'apropos'
      response.should be_success
    end
    
    it "should have the right title" do
      get 'apropos'
      response.should have_selector("title", :content => "A Propos")
    end
  end
end
  
  
  