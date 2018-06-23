class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  skip_before_action :get_current_user, only: [:create, :show, :index] 

  def index
    render_ok User.all
  end

  def show
    render_ok @user
  end

  def create
    user = User.new(user_params)
    if_save_succeeds(user) do |object|
      if not params[:image].nil?
        trans = Transmission.new
        if trans.create_picture(params, user)
          render_ok user
        else
          render_unprocessable({user: user, errors: trans.errors})
        end
      else
        render_ok user
      end
    end
  end

  def update
    @user.update_attributes(user_params)
    if_save_succeeds(@user) do |object|
      if not params[:image].nil?
        trans = Transmission.new
        if trans.create_picture(params, @user)
          render_ok @user
        else
          render_unprocessable({user: @user, errors: trans.errors})
        end
      else
        render_ok @user
      end
    end
  end

  def destroy
    render_ok @user.destroy
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
    params.permit(
      :email, 
      :name, 
      :username, 
      :password
    )
  end
end
