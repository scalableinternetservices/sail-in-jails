require 'test_helper'

class SplashScreenControllerTest < ActionDispatch::IntegrationTest
  test "should get join" do
    get '/join'
    assert_response :success
    assert_select "title", "Join | Group App"
  end


end
