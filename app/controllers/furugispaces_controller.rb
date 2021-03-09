class FurugispacesController < ApplicationController
  def index
    @notices = Notice.order('created_at DESC')
    @events = Event.order('created_at DESC')
    @communities = Community.order('created_at DESC')
    @coordinations = Coordination.order('created_at DESC')
  end
end
