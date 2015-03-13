class RegistrationsController < ApplicationController

  def new
    @user = User.new
    redirect_to root_path, notice: "User was created successfully"
  end

end
