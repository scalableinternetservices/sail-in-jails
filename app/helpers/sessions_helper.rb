module SessionsHelper

  # Logs in the given user.
  def log_in(user)
    session[:user_id] = user.id
  end

  # Returns the current logged-in user (if any).
  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

  def current_team
    if session[:user_id]
      @current_team ||= Team.find_by(id: current_user.team_id)
    end
  end

  def current_course
    if session[:user_id]
      @current_course ||= Course.find_by(id: current_user.course)
    end
  end

  def logged_in?
    !current_user.nil?
  end

  # Logs out the current user.
  def log_out
    session.delete(:user_id)
    @current_user = nil
    @current_team = nil
    @current_course = nil
  end

  # 
  def leave_team
    @current_team = nil
  end

  def new_team(selected_team)
    @current_team = selected_team
  end

end
