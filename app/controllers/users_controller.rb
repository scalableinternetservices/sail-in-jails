class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def index
    @user = User.find(params[:id])
  end
  
  def edit_profile
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes!(user_update_params)
      render 'profile'
    else
      Rails.logger.info(@user.errors.messages.inspect)
      render 'edit_profile'
    end
  end 
  
  
  def profile 
    if logged_in?
      @user = User.where(id: current_user.id)[0]
      @team = Team.find_by(id: @user.team_id)
    end
  end 

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
      flash[:success] = "Welcome to the Sample App!"
    else
      render 'new'
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
    
    def user_update_params
      user_params = params.require(:user).permit(:name, :email, :bio, :password, :password_confirmation)
      user_params[:course] = @user.course
      return user_params
    end

end
