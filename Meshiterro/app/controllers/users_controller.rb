class UsersController < ApplicationController
  def show
    @user = current_user
    @post_images = @user.post_images
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user.id
    @user.update
    redirect_to show_path
  end 
  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
end
