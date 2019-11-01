require 'test_helper'

class ClassesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get '/courses'
    assert_response :success
  end

end
