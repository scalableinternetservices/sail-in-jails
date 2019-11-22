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
    @members = User.where(team_id: @team.id)
  end

  def edit_team
    @team = Team.find(params[:id])
  end

  def update
    if logged_in?
      @team = Team.find(params[:id])
      @user = User.where(id: current_user.id)[0]

      if @user.team_id == @team.id && @user.course == @team.course
        if @team.update_attributes(team_params)
          render 'show'
        else
          render 'edit_team'
        end
      else
        flash.now[:danger] = 'User not in team!'
        render 'edit_team'
      end
    else
      flash.now[:danger] = 'Not logged in!'
      render 'edit_team'
    end
  end

  def create
    @team = Team.new(team_params)
    @team.course = current_user.course
    if @team.save
      redirect_to '/teams/' + (@team.id).to_s
    else
      flash.now[:danger] = 'Invalid info!'
      render 'new'
    end
  end

  def add_user
    if logged_in? 
      @team = Team.where(id: params[:id])[0]
      if current_user.course == @team.course
        current_user.update(team_id: params[:id])
        redirect_to '/teams/' + params[:id]
      end
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
