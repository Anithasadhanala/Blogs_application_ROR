class UsersController < ApplicationController


  # get signup route calls this action
  def new
    @user = User.new
  end
  

  # post signup route calls this action for creating new user
  def create
    @user = User.new(user_params)
    existing_user = User.find_by(username: @user.username) || User.find_by(email: @user.email)
    if existing_user
      flash.now[:alert] = "A user with the same username or email already exists."
      render :new
    elsif @user.save
      session[:user_id] = @user.id
      redirect_to login_path, notice: "Welcome! You have signed up successfully."
    else
      render :signup
    end
  end



  # signin takes only these params
  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

  

  # post signin route calls this action for loginng for specific user
  def login
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session_id = SecureRandom.hex + user.id.to_s
      expires_at = 1.week.from_now
      ActiveSession.create(user_id: user.id, session_id: session_id, expires_at: expires_at)
      session[:user_session_id] = session_id
      redirect_to root_path, notice: 'Logged in successfully'
    else
      flash.now[:alert] = "Invalid email or password"
      render :new
    end
  end



  # delete user route calls this action
  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Logged out successfully"
  end

  
end
