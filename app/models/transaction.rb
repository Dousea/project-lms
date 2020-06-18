# frozen_string_literal: true

class Transaction < ApplicationRecord
  belongs_to :member
  belongs_to :book
end
