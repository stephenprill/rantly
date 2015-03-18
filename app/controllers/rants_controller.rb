class RantsController < ApplicationController

  def index
    @rants = Rant.all
  end

  def new
    @rant = Rant.new
  end

  def create
    # @user = current_user
    # @rant = @user.rants.new(rant_params)

    # or

    # @rant = current_user.rants.new

    @rant = Rant.new(rant_params)
    @rant.user_id = current_user.id
    if @rant.save
      redirect_to rants_path, notice: "New Rant In The Place"
    else
      render :new
    end
  end

  private

  def rant_params
    params.require(:rant).permit(:title, :body, :user_id)
  end


end
