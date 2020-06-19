# frozen_string_literal: true

class BooksController < ApplicationController
  authorize_resource

  def index
    params[:page] = 1 unless params.key? :page
    @books = Book.page(params[:page])
  end

  def show
    @book = Book.find(params[:id])
  rescue ActiveRecord::RecordNotFound => e
    redirect_to books_path, alert: e.message
  end
end
