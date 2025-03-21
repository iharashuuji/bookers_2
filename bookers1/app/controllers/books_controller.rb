class BooksController < ApplicationController
  def top
  end
  def index
      @books = Book.all
      @book = Book.new
      # URLパラメータ名を変更して、削除確認用の本を設定
  end

  def new
      @book = Book.new
  end

  def create
      @books = Book.all
      @book = Book.new(list_params)
      if @book.save
        flash[:notice] = ' Book was successfully created.'
        redirect_to book_path(@book)
      else
      #   @books = Book.all
        render :index
        flash[:notice] = '[error] Book was failed'
      end
  end

  def edit
      @book = Book.find(params[:id])
  end

  def show
      @book = Book.find(params[:id])
  end

  def update
      @book = Book.find(params[:id])
      if @book.update(list_params)
        flash[:notice] = 'Book was successfully updated.'
        redirect_to book_path(@book.id)
      else
        flash[:notice] = '[error] Book was failled  updating.'
        render :edit, status: :unprocessable_entity
      #   render は、そのままを表示できる状態です！
      end
  end
  # destroy action devide into two actions which destroy and confirm 
  # confirm → destroy

  def destroy
      @book = Book.find(params[:id])
      @book.destroy
      redirect_to '/books'
  end


  private

  def list_params
      params.require(:book).permit(:title, :body)
  end
end
