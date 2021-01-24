class NoticesController < ApplicationController
  def index
    @notices = Notice.page(params[:page]).per(1)
  end
end
