require 'test_helper'

class CourseTest < ActiveSupport::TestCase

  def setup
    # @course = Course.new(name: "CS188")
  end

  test "Presence" do
    @course = Course.new(name: "  ")
    assert_not @course.valid?
  end

end
