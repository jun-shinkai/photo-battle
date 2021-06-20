class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @nickname = user.name
    @photos = user.photos
  end
end
