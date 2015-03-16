class RegistrationsController < ApplicationController

  def new
    @user = User.new
  end

  def create
      @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        redirect_to root_path, notice: "Thanks for signing up"
    else
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end


  private

  def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password)
  end

end
