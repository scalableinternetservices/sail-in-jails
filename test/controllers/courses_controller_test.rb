require 'test_helper'

class CoursesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get '/courses'
    assert_response :success
  end

end
