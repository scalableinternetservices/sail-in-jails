class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    if logged_in?
      @user = User.where(id: current_user.id)[0]
    end
  end

  def index
    @user = User.find(params[:id])
  end
  
  
  def edit_profile
    if logged_in?
      @user = User.where(id: current_user.id)[0]
    end
  end
  
  def edit_name
    if logged_in?
      @user = User.where(id: current_user.id)[0]
    end 
  end
  
  def edit_email
    if logged_in?
      @user = User.where(id: current_user.id)[0]
    end 
  end
  
  def update
    if logged_in?
      @user = User.where(id: current_user.id)[0]
  
      if @user.update_attributes(user_update_params)
        render 'show'
      else
        render 'edit_profile'
      end
    end
  end 
  
  # def update
  #   if logged_in?
  #     @user = User.where(id: current_user.id)[0]
      
  
  #     if @user.update_attributes(user_update_params)
  #       render 'show'
  #     else
  #       render 'edit_profile'
  #     end
  #   end
  # end 
  
  
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
      params.require(:user).permit!
    end

end
