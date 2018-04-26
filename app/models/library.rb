class Library < ApplicationRecord
    validates :name, presence: true
    has_many :book_library_relations
    has_many :books, through: :book_library_relations
    validates :name , :uniqueness => {:scope => [ :location]}

end
