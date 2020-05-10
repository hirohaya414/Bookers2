class UsersController < ApplicationController
	before_action :authenticate_user!

  def index
  	@users = User.all
  end

  def show
  	@user = User.find_by(params[:id])
    @books = Book.all
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update(user_params)
  	  flash[:notice] = "You have updated user successfully."
  	  redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
  	if book.destroy
      flash[:notice] = "Signed out successfully."
  	  redirect_to root_path
    end
  end
  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
