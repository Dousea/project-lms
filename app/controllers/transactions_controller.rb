# frozen_string_literal: true

class TransactionsController < ApplicationController
  authorize_resource

  def index
    params[:page] = 1 unless params.key? :page
    @transactions = Transaction.page(params[:page])
  end

  def show
    @transaction = Transaction.find(params[:id])
  rescue ActiveRecord::RecordNotFound => e
    redirect_to transactions_path, alert: e.message
  end
end
