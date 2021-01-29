class CoordinationsController < ApplicationController

  def index
    @coordinations = Coordination.all
  end
end
