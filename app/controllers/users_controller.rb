class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @nickname = current_user.user_nickname
  end
end
