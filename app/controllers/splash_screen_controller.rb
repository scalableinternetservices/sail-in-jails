class SplashScreenController < ApplicationController
  def join
    @id = params[:id]
    @course = Course.where(id: @id)[0]
    @user = User.where(id: current_user.id)[0]
  end

  def create
  end

  def team_index
    @teams = Team.all
  end 

end
