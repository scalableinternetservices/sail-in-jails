class SplashScreenController < ApplicationController
  def join
  end

  def create
    @team = Team.new(params[:team])
  end

  def team_index
    @teams = Team.all
  end 

end
