# frozen_string_literal: true

class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title
      t.references :publisher, null: false, foreign_key: true
      t.date :published_at

      t.timestamps
    end

    create_join_table :books, :authors do |t|
      t.index :book_id
      t.index :author_id
    end

    create_join_table :books, :subjects do |t|
      t.index :book_id
      t.index :subject_id
    end
  end
end
