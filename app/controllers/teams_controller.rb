class TeamsController < ApplicationController
  
  def new
    @team = Team.new 
  end
  
  def show
    @team = Team.find(params[:id])
  end 
  
  def create 
    @team = Team.new(team_params)
    if @team.save
      # Handle successful case
    else
      render 'new'
    end 
  end 
  
  private
  def team_params
    params.require(:team).permit(:name, :desc, :course)
  end 
  
end
