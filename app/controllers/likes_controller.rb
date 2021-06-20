class LikesController < ApplicationController
  before_action :photo_params

  def create
    Like.create(user_id: current_user.id, photo_id: params[:id])
    redirect_to photos_path
  end

  def destroy
    Like.find_by(user_id: current_user.id, photo_id: params[:id]).destroy
    redirect_to photos_path
  end

  private

  def photo_params
    @photo = Photo.find(params[:id])
  end
end