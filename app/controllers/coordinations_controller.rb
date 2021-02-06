class CoordinationsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :destroy]

  def index
    @coordinations = Coordination.order("created_at DESC").page(params[:page]).per(9)
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
  end

  def edit
    if @coordination.user_id != current_user.id
      redirect_to new_user_session_path
    end
  end

  def update
    if @coordination.update(coordination_params)
      redirect_to coordination_path(@coordination.id)
    else
      render :edit
    end
  end

  def destroy
    if @coordination.user_id == current_user.id
      @coordination.destroy
      redirect_to coordinations_path
    else
      render :index
    end
  end

  private

  def coordination_params
    params.require(:coordination).permit(:coordination_title, :image, :coordination_profile, :item_id, :item_text).merge(user_id: current_user.id)
  end

  def set_item
    @coordination = Coordination.find(params[:id])
  end
end
