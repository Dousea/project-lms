# frozen_string_literal: true

class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.belongs_to :member
      t.belongs_to :book
      t.timestamps
    end
  end
end
