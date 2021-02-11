class CommunitiesController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :destroy]

  def index
    @communities = Community.order("created_at DESC").page(params[:page]).per(9)
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
    @messages = Message.all
    set_user_id_to_cookie
  end

  def edit
    if @community.user_id != current_user.id
      redirect_to new_user_session_path
    end
  end

  def update
    if @community.update(community_params)
      redirect_to community_path(@community.id)
    else
      render :edit
    end
  end

  def destroy
    if @community.user_id == current_user.id
      @community.destroy
      redirect_to communities_path
    else
      render :index
    end
  end

  private

  def community_params
    params.require(:community).permit(:community_title, :community_profile, :image).merge(user_id: current_user.id)
  end

  def set_item
    @community = Community.find(params[:id])
  end

  def set_user_id_to_cookie
    if cookies.signed['user_id'].blank?
      cookies.signed['user_id'] = current_user.id
    end
  end

end
