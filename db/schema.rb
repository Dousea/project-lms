# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_06_18_022726) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authors", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "authors_books", id: false, force: :cascade do |t|
    t.bigint "book_id", null: false
    t.bigint "author_id", null: false
    t.index ["author_id"], name: "index_authors_books_on_author_id"
    t.index ["book_id"], name: "index_authors_books_on_book_id"
  end

  create_table "books", force: :cascade do |t|
    t.string "title"
    t.bigint "publisher_id", null: false
    t.date "published_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["publisher_id"], name: "index_books_on_publisher_id"
  end

  create_table "books_subjects", id: false, force: :cascade do |t|
    t.bigint "book_id", null: false
    t.bigint "subject_id", null: false
    t.index ["book_id"], name: "index_books_subjects_on_book_id"
    t.index ["subject_id"], name: "index_books_subjects_on_subject_id"
  end

  create_table "publishers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "subjects", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "transactions", force: :cascade do |t|
    t.bigint "member_id"
    t.bigint "book_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.date "due_date"
    t.index ["book_id"], name: "index_transactions_on_book_id"
    t.index ["member_id"], name: "index_transactions_on_member_id"
  end

# Could not dump table "users" because of following StandardError
#   Unknown type 'user_role' for column 'role'

  add_foreign_key "books", "publishers"
end
