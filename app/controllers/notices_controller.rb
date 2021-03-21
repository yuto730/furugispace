class NoticesController < ApplicationController
  before_action :set_notice, only: %i[show edit update destroy]
  before_action :authenticate_store!, only: %i[new edit]
  before_action :move_to_index, only: %i[edit update destory]

  def index
    @notices = Notice.order("created_at DESC").page(params[:page]).per(9)
  end

  def new
    @notice = Notice.new
    @notice_details = @notice.notice_details.new
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
    @notices = Notice.order('created_at DESC')
  end

  def edit
    @notice_details = @notice.notice_details.build
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
    params.require(:notice).permit(:notice_title, :thumbnail, :notice_display,
                                    notice_details_attributes: %i[id notice_id notice_heading image notice_description _destroy]).merge(store_id: current_store.id)
  end

  def set_notice
    @notice = Notice.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless @notice.store_id == current_store.id
  end
end
