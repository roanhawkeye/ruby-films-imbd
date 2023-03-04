# frozen_string_literal: true

# Controller to handle the user request
class UsersController < ApplicationController
  before_action :authenticate_admin!, only: [:create, :update, :destroy]
  caches_page :index

  def index
    @users = User.all
  end

  def show
    @presenter = UserPresenter.new(User.find(params[:id]))
  end

  def new
    @form = UserForm.new
  end

  def create
    @form = UserForm.new(user_form_params)

    if @form.submit
      redirect_to users_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to @user
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to root_path, status: :see_other
  end

  private

  def user_form_params
    params.require(:user_form).permit(:first_name, :last_name, :role, :password, :email)
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :role, :password, :email)
  end
end
