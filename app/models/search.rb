class Search < ApplicationRecord


    def search_books
        books = Book.all
        books = books.where(["name LIKE ?","%#{name}%"]) if name.present?
        books = books.where(["ISBN LIKE ?",isbn]) if isbn.present?
        books = books.where(["publication_year LIKE ?",publication_year]) if publication_year.present?
        books = books.where(["author LIKE ?",author]) if author.present?
        puts "***************************"
        puts category
        category_search = Category.where(name: category).take
        books = books.where(["category_id LIKE ?",category_search.id]) if category.present?
        return books
    end

end
