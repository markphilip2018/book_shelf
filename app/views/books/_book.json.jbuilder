json.extract! book, :id, :category_id, :ISBN, :publication_year, :name, :author, :created_at, :updated_at
json.url book_url(book, format: :json)
