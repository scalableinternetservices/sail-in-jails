class SplashScreenController < ApplicationController
  skip_before_action :verify_authenticity_token
  def join
    @id = params[:id]
    @course = Course.where(id: @id)[0]

    if logged_in?
      @user = User.where(id: current_user.id)[0]
    else
      @user = User.new
    end
  end

  def create
  end

  def team_index
    @teams = Team.all
  end 

private



end
