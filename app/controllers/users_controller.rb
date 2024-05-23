class UsersController < ApplicationController

    def new
      @user = User.new
    end
  


    
    def create
      @user = User.new(user_params)
       # Check if a user with the same username or email already exists
      existing_user = User.find_by(username: @user.username) || User.find_by(email: @user.email)

      if existing_user
        flash.now[:alert] = "A user with the same username or email already exists."
        render :new
        puts("---------------------------",existing_user)
      
      elsif @user.save
        session[:user_id] = @user.id
        redirect_to login_path, notice: "Welcome! You have signed up successfully."
      else
        render :signup
      end
    end
  

    private
    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end

  

  def login
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
     
      session[:user_id] = user.id
      redirect_to root_path, notice: "Logged in successfully"
      puts("++++++++++++++++++++++++++")
    else
    
      flash.now[:alert] = "Invalid email or password"
      render :new
    end
  end


  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Logged out successfully"
  end

  
end
