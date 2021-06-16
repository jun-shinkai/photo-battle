class PhotosController < ApplicationController
  before_action :set_tweet, only: [:edit, :show]

  def index
    @photos = Photo.all
  end

  def new
    @photo = Photo.new
  end
  def create
   Photo.create(photo_params)
  end

  def destroy
    photo = Photo.find(params[:id])
    photo.destroy
  end

  def edit 
  end
  
  def update
    photo = Photo.find(params[:id])
    photo.update(photo_params)
  end
    
  def show
  end

  
  private

  def photo_params
    params.require(:photo).permit(:name,:image,:info).merge(user_id: current_user.id)
  end

  def set_tweet
    @photo = Tweet.find(params[:id])
  end
end
