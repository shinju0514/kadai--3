class BooksController < ApplicationController
  before_action :correct_user, only: [:edit, :update]

  def new
    @book=Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
   if @book.save
     flash[:notice]="successfully"
      redirect_to book_path(@book.id)
   else
     @books=Book.all
     @user=current_user
      render :index
   end
  end

  def show
    @book=Book.find(params[:id])
    @books=Book.all
    @book_new=Book.new
    @user=@book.user
  end

  def index
    @books=Book.all
    @book=Book.new
    @user=current_user
  end

  def edit
    @book=Book.find(params[:id])
    if @book.user == current_user
      render "edit"
    else
      redirect_to books_path
    end
  end


  def destroy
    @book=Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  def update
       @book=Book.find(params[:id])
    if @book.update(book_params)
     flash[:notice]="successfully"
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

  def correct_user
    @book = Book.find(params[:id])
    @user = @book.user
    redirect_to(books_path) unless @user == current_user
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction ,:profile_image)
  end

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
