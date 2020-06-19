# frozen_string_literal: true

class Books::PublishersController < ApplicationController
  authorize_resource

  def index
    params[:page] = 1 unless params.key? :page
    @publishers = Publisher.page(params[:page])
  end

  def show
    @publisher = Publisher.find(params[:id])
  rescue ActiveRecord::RecordNotFound => e
    redirect_to books_publishers_path, alert: e.message
  end
end
