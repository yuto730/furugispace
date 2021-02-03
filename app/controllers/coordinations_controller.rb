class CoordinationsController < ApplicationController

  def index
    @coordinations = Coordination.page(params[:page]).per(1)
  end

  def new
    @coordination = Coordination.new
  end

  def create
    @coordination = Coordination.create(coordination_params)
    if @coordination.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @coordination = Coordination.find(params[:id])
  end

  private

  def coordination_params
    params.require(:coordination).permit(:coordination_title, :image, :coordination_profile, :item_id, :item_text).merge(user_id: current_user.id)
  end
end
