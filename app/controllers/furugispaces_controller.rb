class FurugispacesController < ApplicationController
  def index
  end

  def noticeDetail
    @notice = Notice.find(params[:id])
  end
end
