class NoticesController < ApplicationController
  def index
    @notices = Notice.page(params[:page]).per(1)
  end

  def new
    @notice = Notice.new
  end

  def create
    notice = Notice.new(notice_params)
    if notice.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def notice_params
    params.require(:notice).permit(:notice_title, :thumbnail, :notice_display, :notice_heading, :image, :notice_description).merge(store_id: current_store.id)
  end
end
