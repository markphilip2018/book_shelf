require 'test_helper'

class BooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @book = books(:one)
  end

  test "should get index" do
    get books_url
    assert_response :success
  end

  test "should get new" do
    get new_book_url
    assert_response :success
  end

  test "should get edit" do
    get edit_book_url(@book)
    assert_response :success
  end

  test "should create book" do
    assert_no_difference('Book.count') do
      post books_url, params: { book: { ISBN: @book.ISBN, author: @book.author, category_id: @book.category_id, library_id: @book.library_id, name: @book.name, publication_year: @book.publication_year } }
    end

    assert_redirected_to book_url(Book.last)
  end


  test "should show book" do
    get book_url(@book)
    assert_response :success
  end


  test "should update book" do
    patch book_url(@book), params: { book: { ISBN: @book.ISBN, author: @book.author, category_id: @book.category_id, library_id: @book.library_id, name: @book.name, publication_year: @book.publication_year } }
    assert_redirected_to book_url(@book)
  end

  test "shouldn't create book repeted ISBN" do
    assert_no_difference('Book.count') do
      post books_url, params: { book: { ISBN: @book.ISBN, author: @book.author, category_id: @book.category_id, library_id: @book.library_id, name: @book.name, publication_year: @book.publication_year } }
    end

  end


  test "shouldn't create book no library " do
    assert_no_difference('Book.count') do
      post books_url, params: { book: { ISBN: @book.ISBN, author: @book.author, category_id: @book.category_id, name: @book.name, publication_year: @book.publication_year } }
    end

  end


  test "shouldn't create book no name" do
    assert_no_difference('Book.count') do
      post books_url, params: { book: { ISBN: @book.ISBN, author: @book.author, category_id: @book.category_id, library_id: @book.library_id, publication_year: @book.publication_year } }
    end

  end

  test "shouldn't create book invalid ISBN" do
    assert_no_difference('Book.count') do
      post books_url, params: { book: { author: @book.author, category_id: @book.category_id, library_id: @book.library_id, name: @book.name, publication_year: @book.publication_year } }
    end

  end

end
