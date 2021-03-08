class NoticesController < ApplicationController
  before_action :set_notice, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_store!, only: [:new, :edit]
  before_action :move_to_index, only: [:edit, :update, :destory]


  def index
    @notices = Notice.page(params[:page]).per(3)
  end

  def new
    @notice = Notice.new
  end

  def create
    notice = Notice.create(notice_params)
    if notice.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @notices = Notice.order("created_at DESC")
  end

  def edit
  end

  def update
    if @notice.update(notice_params)
      redirect_to notice_path(@notice.id)
    else
      render :edit
    end
  end

  def destroy
    @notice.destroy
    redirect_to root_path
  end


  private

  def notice_params
    params.require(:notice).permit(:notice_title, :thumbnail, :notice_display, :notice_heading, :image, :notice_description).merge(store_id: current_store.id)
  end

  def set_notice
    @notice = Notice.find(params[:id])
  end

  def move_to_index
    unless @notice.store_id == current_store.id
      redirect_to action: :index
    end
  end

end
