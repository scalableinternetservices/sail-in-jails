require 'test_helper'

class CoursesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get '/courses/create'
    assert_response :success
  end

end
