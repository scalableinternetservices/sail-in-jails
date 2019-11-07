class SplashScreenController < ApplicationController
  def join
  end
  
  
  def create
  end

  def team_index
    @teams = Team.all
  end 
  
 

end
