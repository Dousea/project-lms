# frozen_string_literal: true

require 'csv'

def find_or_create_author(book, author_name)
  return if book.authors.exists?(name: author_name)

  author = Author.where(name: author_name).first

  if author.nil?
    book.authors.build(name: author_name)
  else
    book.authors << author
  end
end

def find_or_create_subject(book, subject_name)
  return if book.subjects.exists?(name: subject_name)

  subject = Subject.where(name: subject_name).first

  if subject.nil?
    book.subjects.build(name: subject_name)
  else
    book.subjects << subject
  end
end

def create_book_from_row(row)
  book = Book.new
  book.title = row['title']
  book.published_at = Time.parse(row['published_at']).to_date
  book.publisher = Publisher.where(name: row['publisher'])
                            .first_or_create

  find_or_create_author(book, row['author'])
  row['subjects'].split('|') { |subject| find_or_create_subject(book, subject) }

  book.save
  book
end

def seed_books
  csv_text = File.read(Rails.root.join('lib', 'seeds', 'books_mock_data.csv'))
  csv = CSV.parse(csv_text, headers: true, encoding: 'ISO-8859-1')
  csv.each do |row|
    book = create_book_from_row(row)

    if book.persisted?
      puts "#{book.title} saved"
    else
      puts "Errors: #{book.errors.messages}"
    end
  end
end
