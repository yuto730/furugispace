class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def show
  end

  def followings
    @user =User.find(params[:id])
    @users =@user.followings.page(params[:page]).per(5)
    render 'show_followings'
  end

  def followers
    @user =User.find(params[:id])
    @users =@user.followers.page(params[:page]).per(5)
    render 'show_followers'
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
