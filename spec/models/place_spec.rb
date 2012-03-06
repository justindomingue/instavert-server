require 'spec_helper'

describe Place do
  before(:each) do
    @attr = { :name => "Garbage", :content => "Usual garbage", :tags => "poubelle" }
  end
  
  it "should create a new instance given valid attributes" do
    Places.create!(@attr)
  end
  
  it "should require a name" do
    no_name_place = Place.new(@attr.merge(:name=>""))
    no_name_place.should_not be_valid
  end
  
  it "should allow no content and no tags places" do
    no_content_and_tags_place = Place.new(@attr.merge(:content=>"", :tags=>""))
    no_content_and_tags_place.should be_valid
  end
end

# == Schema Information
#
# Table name: places
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  content    :string(255)
#  tags       :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

