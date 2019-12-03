class SplashScreenController < ApplicationController
  def join

    if logged_in?
      @user = current_user
      @course = current_course
      if Team.where(course: @user.course)
        @all_teams = Team.where(course: @user.course)
      else 
        @all_teams = []
      end
    else
      @id = params[:id]
      @user = User.new
      @all_courses = Course.all
      if Team.where(course: @id)
        @all_teams = Team.where(course: @id)
      else 
        @all_teams = []
      end
    end
  end

  def create
  end

  def team_index
    @teams = Team.all
  end 

private

end
