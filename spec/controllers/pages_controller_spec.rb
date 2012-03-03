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
end
  
  
  