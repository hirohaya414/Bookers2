class UsersController < ApplicationController
	before_action :authenticate_user!
  before_action :correct_user, only: [:edit]

  def index
  	@users = User.all
    @book = Book.new
  end

  def show
  	@user = User.find(params[:id])
    @book = Book.new
    @books = @user.books
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

  def follows
    @user  = User.find(params[:id])
    render 'follows'
  end

  def followers
    @user  = User.find(params[:id])
    render 'followers'
  end

  private
  def correct_user
    user = User.find(params[:id])
    if user != current_user
      redirect_to user_path(current_user)
    end
  end

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
