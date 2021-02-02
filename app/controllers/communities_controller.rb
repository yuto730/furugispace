class CommunitiesController < ApplicationController

  def index
    @communities = Community.page(params[:page]).per(1)
  end

  def new
    @community = Community.new
  end

  def create
    @community = Community.create(community_params)
    if @community.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @community = Community.find(params[:id])
  end

  private

  def community_params
    params.require(:community).permit(:community_title, :community_profile, :image).merge(user_id: current_user.id)
  end

end
