class UsersController < ApplicationController

 # before_action :only => [:edit] do
 #    @user = User.find(params[:id])
 #    if current_user.admin || @user == current_user
 #    else
 #      raise AccessDenied
 #    end
 #  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @rant = @user.rants.all
  end

end
