require 'spec_helper'

describe PlacesController do
  render_views
  
  describe "for mobile" do
    
    describe "GET 'index'" do
      it "should be successful" do
        get 'index'
        response.should be_success
      end
    end
  end
end
