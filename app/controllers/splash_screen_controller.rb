class SplashScreenController < ApplicationController
  def join
    @id = params[:id]
    @course = Course.where(id: @id)[0]

    if !logged_in?
      @teams_and_courses = Team.find_by_sql(["
  SELECT teams.*, courses.name AS course_name
    FROM teams
      INNER JOIN courses ON courses.id = teams.course
    LIMIT 10"])
    end
  end

  def create
  end

  def team_index
    @teams = Team.all
  end

private



end
