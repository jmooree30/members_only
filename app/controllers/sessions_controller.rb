class SessionsController < ApplicationController
    def index 
    end 
    
    def new
    end

    def create
        user = User.find_by(email: params[:session][:email])
        if user && user.authenticate(params[:session][:password])
            log_in(user)
            flash[:success] = "You have been signed in!"
            redirect_to root_path
        else
            flash[:danger] = "Invalid password/email combination, please try again."
            redirect_to login_path
        end
    end 

    def destroy
      log_out 
      flash[:info] = "You have been successfully logged out."
      redirect_to root_path
    end

end
