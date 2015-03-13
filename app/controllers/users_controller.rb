class UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
    redirect_to root_path, notice: "Thanks for signing up"
  else
    render :new
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :passowrd)
  end
end
