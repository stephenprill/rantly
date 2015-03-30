class RantsController < ApplicationController

  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    # @rants = Rant.all
    @rants = Rant.search(params[:search])
    if @rants.count < 1
      flash.now[:notice] = "These aren't droids you were looking for"
    render :index
    end
  end

  def new
    if current_user
    @rant = Rant.new
  else
    redirect_to rants_path, notice: "fuck off"
  end
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

  def edit
    @rant = Rant.find(params[:id])
    render :edit
  end

  def update
    @rant = Rant.find(params[:id])
    if @rant.update(rant_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @rant = Rant.find(params[:id])
    @rant.destroy
    redirect_to root_path
  end

  private

  def rant_params
    params.require(:rant).permit(:title, :body, :user_id)
  end

  def correct_user
    @rant = current_user.rants.find_by(id: params[:id])
    redirect_to root_path, notice: "not authorized to edit the rant" if @rant.nil?
  end


end
