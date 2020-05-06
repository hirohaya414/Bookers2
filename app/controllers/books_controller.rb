class BooksController < ApplicationController
	# before_action :authenticate_user!
	
	def new
    end

    def create
      @book = Book.new(book_params)
      if @book.save
        flash[:notice] = "You have created successfully "
        redirect_to book_path(@book.id)
      end
    end

    def index
    end

    def show
      @book = Book.new(book_params)
      if @book.save
        flash[:notice] = "You have created successfully "
        redirect_to book_path(@book.id)
      end
    end

    def destroy
      book = Book.find(params[:id])
      book.destroy
      redirect_to books_path
    end

    private
    def book_params
    params.require(:book).permit(:title, :body)
  end
end
