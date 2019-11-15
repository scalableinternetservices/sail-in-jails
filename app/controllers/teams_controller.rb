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
    @team = Team.find(params[:id])
    if @team.update_attributes(team_params)
      render 'show'
    else 
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
