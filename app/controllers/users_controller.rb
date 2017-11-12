class UsersController < ApplicationController
    def index
    end

   def new
     @user = User.new
   end 

   def create
    @user = User.new(user_params)
    if @user.save
      flash[:info] = "Account created, you may now log in."
      redirect_to root_path
    else
      flash[:info] = "Invalid signup information, please try again."
      redirect_to new_user_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

end
