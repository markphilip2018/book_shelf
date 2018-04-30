class Book < ApplicationRecord
  belongs_to :category
  belongs_to :library
  has_many :book_library_relations
  has_many :libraries, through: :book_library_relations
  validates :ISBN , :uniqueness => true , presence: true
  validates :name , presence: true
  validates :library , presence: true
end
