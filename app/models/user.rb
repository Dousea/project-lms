# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: { Admin: 'admin', Moderator: 'moderator', Member: 'member' }
  validates :role, inclusion: { in: roles.keys }
  self.inheritance_column = :role

  validates :name, :address, :phone_number, presence: true
end
