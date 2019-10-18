require 'test_helper'

class TeamTest < ActiveSupport::TestCase

  def setup
  end

  test "Presence" do
    @team = Team.new(name: "  ", desc: ' ', course: 1)
    assert_not @team.valid?
    @team.name = "Valid name"
    assert_not @team.valid?
    @team.desc = "Valid desc"
    assert @team.valid?
  end

end
