class PhotosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_tweet, only: [:edit, :show]
  before_action :move_to_index, except: [:index, :show, :search]
  def index
    @photos = Photo.includes(:liked_users).sort {|a,b| b.liked_users.size <=> a.liked_users.size}
  end

  def new
    @photo = Photo.new
  end
  def create
    binding.pry
    @photo = Photo.create(photo_params)

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
    @comment = Comment.new
    @comments = @photo.comments.includes(:user)
    @like = Like.new
  end

  def search
    @photos = Photo.search(params[:keyword])
  end
  
  private

  def photo_params
    params.require(:photo).permit(:title_image,:info, :tag_list,:title,:price).merge(user_id: current_user.id)
  end

  def set_tweet
    @photo = Photo.find(params[:id])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

end