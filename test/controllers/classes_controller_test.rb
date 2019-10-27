require 'test_helper'

class ClassesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get '/classes'
    assert_response :success
  end

end
