class FurugispacesController < ApplicationController
  def index
  end

  def notice
    @notices = Notice.page(params[:page]).per(1)
  end

  def noticeDetail
    @notice = Notice.find(params[:id])
  end
end
