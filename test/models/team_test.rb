require 'test_helper'

class TeamTest < ActiveSupport::TestCase

  def setup
    @team = Team.new(name: "Team 1", desc: "Sample Description", course: 11)
  end
  
  test "should be valid" do
    assert @team.valid?
  end
  
  test "name should be present" do
    @team.name = "     "
    assert_not @team.valid?
  end
  
  test "desc should be present" do
    @team.desc = "     "
    assert_not @team.valid?
  end
  
  test "name & desc should not be too long" do
    @team.name = "a" * 101
    assert_not @team.valid?
    @team.desc = "a" * 1001
    assert_not @team.valid?
  end

  test "name addresses should be unique" do
    duplicate_team = @team.dup
    @team.save
    assert_not duplicate_team.valid?
  end
  


  # test "Presence" do
  #   @team = Team.new(name: "  ", desc: ' ', course: 1)
  #   assert_not @team.valid?
  #   @team.name = "Valid name"
  #   assert_not @team.valid?
  #   @team.desc = "Valid desc"
  #   assert @team.valid?
  # end

end
