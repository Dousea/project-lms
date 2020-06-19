# frozen_string_literal: true

class Books::AuthorsController < ApplicationController
  authorize_resource

  def index
    params[:page] = 1 unless params.key? :page
    @authors = Author.page(params[:page])
  end

  def show
    @author = Author.find(params[:id])
  rescue ActiveRecord::RecordNotFound => e
    redirect_to books_authors_path, alert: e.message
  end
end
