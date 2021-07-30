class UsersController < ApplicationController
  def create
    @user = User.create(user_params)
    @user.password_confirmation = user_params[:password]
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash[:alert] = @user.errors.full_messages
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:creator, :noteid, :email, :password, :password_confirmation)
  end
end
