class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]


  def show
    @user = User.find(params[:id])
  
    @prototypes = @user.prototypes
    @name = @user.name
    @profile = @user.profile
    @occupation = @user.occupation
    @position = @user.position
  end

  def edit
  end

  def update
    @prototypes = @user.prototypes
    if @user.update(user_params)
      redirect_to user_path(@user.id)
    else
      render :edit
    end

  def destroy
    if @user.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  end

  private

  def user_params
    params.fetch(:user, {}).permit(:name, :profile, :occupation, :position, :email)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def correct_user
    unless user_signed_in? && current_user.id == @user.id
      redirect_to root_path
    end
  end
end
