class Book < ApplicationRecord
  belongs_to :library
  belongs_to :category
end
