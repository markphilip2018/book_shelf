class BookLibraryRelation < ApplicationRecord
    belongs_to :library
    belongs_to :book
end
