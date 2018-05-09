class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  before_action :check_admin, only:[:create,:edit, :update, :destroy]
  # GET /books
  # GET /books.json
  def index

   @books = Book.all

  end

  # GET /books/1
  # GET /books/1.json
  def show
  end

  # GET /books/new
  def new
    @book = Book.new
    @category = Category.pluck(:id)
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books
  # POST /books.json
  def create
    @category = Category.pluck(:id)
    @book = Book.new(book_params)

    respond_to do |format|
      @book_search = Book.where(ISBN: @book.ISBN).take

      if(@book_search != nil)
        book_library_search = BookLibraryRelation.where(book_id: @book_search.id , library_id: current_admin.library_id).take
        msg ='Book is already in library'
        if(book_library_search == nil)
          @book_library = BookLibraryRelation.new(:book_id=>@book_search.id,:library_id=> current_admin.library_id)
          @book_library.save
          msg = 'Book was successfully created'
        end
        format.html { redirect_to @book_search, notice: msg }
        format.json { render :show, status: :created, location: @book_search }
      else

        if @book.save
          @book_library = BookLibraryRelation.new(:book_id=>@book.id,:library_id=> current_admin.library_id)
          @book_library.save

          format.html { redirect_to @book, notice: 'Book was successfully created.' }
          format.json { render :show, status: :created, location: @book }
        else
          format.html { render :new }
          format.json { render json: @book.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    #@book.destroy
    #@book_library = BookLibraryRelation.new(:book_id=>@book_search.id,:library_id=> @book_search.library_id)
    @book_search = BookLibraryRelation.where(book_id: @book.id).take
    @book_search.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: 'Book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params

      params.require(:book).permit(:category_id, :ISBN, :publication_year, :name, :author)
    end

    def check_admin
      if !admin_logged_in?
        redirect_to login_path
      end
    end
end
