class BooksController < ApplicationController

  def create
    @book = Book.new(book_params)
    if @book.save
       flash[:success] = 'book was successfully created.'
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :index
    end  # This line was missing
  end

  def index
    @books = Book.all
    @book = Book.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def destroy
    book = Book.find(params[:id])
    if book.destroy
    flash[:notice] = "Book was successfully destroyed."
    book.destroy
    end

    redirect_to '/books'
  end

  def show
    @book = Book.find(params[:id])

  end

  def update
    @book = Book.find(params[:id])

   if @book.update(book_params)
    flash[:success] = 'Book was successfully updated.'
    redirect_to @book

   else
     render :edit
   end



  end

  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
