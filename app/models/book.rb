class Book < ApplicationRecord
  validates :title, precence: true
  validates :body, precence: true
end
