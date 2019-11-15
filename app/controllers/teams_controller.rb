class TeamsController < ApplicationController

  def new
    if logged_in?
      @team = Team.new
    else
      flash[:notice] = 'Unauthorized people are not allowed to create teams :('
      redirect_to '/login'
    end
  end

  def team_index
    @teams = Team.all
  end

  def show
    @team = Team.find(params[:id])
  end

  def edit_team
    @team = Team.find(params[:id])
  end

  def update
    @team = Team.find(params[:id])
    if @team.update_attributes(team_params)
      render 'show'
    else
      render 'edit_team'
    end
  end

  def create
    @team = Team.new(team_params)
    @team.course = current_user.course
    if @team.save
      render 'show'
    else
      flash.now[:danger] = 'Invalid info!'
      render 'new'
    end
  end

  private
  def team_params
    params.require(:team).permit(:name, :desc)
  end

  def get_coursename
    crs = Course.find_by(id: @team.course)
    if crs
      return crs.name
    else
      return "No associated course!"
    end
  end

end
