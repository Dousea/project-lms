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

  def new
    @transaction = Transaction.new
  end

  def create
    @transaction = Transaction.new(transaction_params)
    @transaction.member = current_user unless current_user.Member?
    @transaction.due_date = Date.current.advance(weeks: 2).to_s

    if @transaction.save
      redirect_to @transaction
    else
      render 'new'
    end
  end

  private

  def transaction_params
    params.require(:transaction).permit(:book_id)
  end
end
