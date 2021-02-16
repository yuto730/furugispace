class CommunityUsersController < ApplicationController
  before_action :set_room, only: [:create, :destroy]

  def create
    if CommunityUser.create(user_id: @user.id, community_id: @community.id)
      redirect_to @community
    else
      redirect_to root_path
    end
  end

  def destroy
    if room=CommunityUser.find_by(user_id: @user.id, community_id: @community.id)
      room.delete
      redirect_to @community
    else
      redirect_to root_path
    end
  end

  private

  def set_room
    @user = current_user
    @community = Community.find(params[:community_id])
  end
end
