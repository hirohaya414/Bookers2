class UsersController < ApplicationController
	# before_action :authenticate_user!

  def index
  	@users = User.all
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created successfully."
      redirect_to books_path
    end
  end

  def show
  	@user = User.find(params[:id])
    @book = @user.book_ids
    @book = Book.new
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update(user_params)
  	flash[:notice] = "You have updated user successfully."
  	redirect_to user_path(@user)
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
    params.require(:user).permit(:name, :introduction, :profile_image_id)
  end
end
