class SplashScreenController < ApplicationController
  def join
    @id = params[:id]
    @course = Course.where(id: @id)[0]
    fresh_when etag: @id || @course
    
    if logged_in?
      @user = User.where(id: current_user.id)[0]
    else
      @user = User.new
    end
  end

  def create
  end

  def team_index
    if stale?([Team.all, Team.community, Team.comments])
      @teams = Team.all
    end
  end 

private



end
