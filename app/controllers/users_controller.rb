# frozen_string_literal: true

class UsersController < ApplicationController
  authorize_resource

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  rescue ActiveRecord::RecordNotFound => e
    redirect_to users_path, alert: e.message
  end
end
