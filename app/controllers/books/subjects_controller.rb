# frozen_string_literal: true

class Books::SubjectsController < ApplicationController
  authorize_resource

  def index
    params[:page] = 1 unless params.key? :page
    @subjects = Subject.page(params[:page])
  end

  def show
    @subject = Subject.find(params[:id])
  rescue ActiveRecord::RecordNotFound => e
    redirect_to books_subjects_path, alert: e.message
  end
end
