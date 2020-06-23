# frozen_string_literal: true

class UsersController < ApplicationController
  authorize_resource

  def index
    params[:page] = 1 unless params.key? :page
    @users = User.where.not(id: current_user.id).page(params[:page])
    redirect_to root_path if current_user.Member?
  end

  def show
    @user = User.find(params[:id])
  rescue ActiveRecord::RecordNotFound => e
    redirect_to users_path, alert: e.message
  end
end
