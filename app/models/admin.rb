class Admin < ApplicationRecord
  belongs_to :library
  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true
end
