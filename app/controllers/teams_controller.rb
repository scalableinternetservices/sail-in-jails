class TeamsController < ApplicationController

  def new
    @team = Team.new
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
    #make sure the user is in the right 
    if logged_in?
      @team = Team.find(params[:id])
      @user = User.where(id: current_user.id)[0]

      if @user.team_id = @team.id && @user.course == @team.course
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
    if @team.save
      render 'show'
    else
      flash.now[:danger] = 'Invalid info!'
      render 'new'
    end
  end

  private
  def team_params
    params.require(:team).permit(:name, :desc, :course)
  end

end
