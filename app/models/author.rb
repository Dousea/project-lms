# frozen_string_literal: true

class Author < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_and_belongs_to_many :books
end
