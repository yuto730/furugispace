class CoordinationsController < ApplicationController
  before_action :set_item, only: %i[show edit update destroy]
  before_action :authenticate_user!, only: %i[new edit destroy]

  def index
    @coordinations = Coordination.order('created_at DESC').page(params[:page]).per(9)
  end

  def new
    @coordination = Coordination.new
    @coordination_items = @coordination.coordination_items.new
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
    @comment = Comment.new
    @comments = @coordination.comments.includes(:user)
  end

  def edit
    redirect_to new_user_session_path if @coordination.user_id != current_user.id
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
    params.require(:coordination).permit(:coordination_title, :image, :coordination_profile,
                                         coordination_items_attributes: %i[id item_id item_text _destroy]).merge(user_id: current_user.id)
  end

  def set_item
    @coordination = Coordination.find(params[:id])
  end
end
