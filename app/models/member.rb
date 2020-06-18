# frozen_string_literal: true

class Member < User
  has_many :transactions, dependent: :destroy
end
