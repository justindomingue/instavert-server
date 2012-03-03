require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get accueil" do
    get :accueil
    assert_response :success
  end

  test "should get astuces" do
    get :astuces
    assert_response :success
  end

  test "should get instructions" do
    get :instructions
    assert_response :success
  end

  test "should get contacts" do
    get :contacts
    assert_response :success
  end

end
