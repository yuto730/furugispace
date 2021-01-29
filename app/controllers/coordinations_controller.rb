class CoordinationsController < ApplicationController

  def index
    @coordinations = Coordination.all
  end

  def show
  end
end
