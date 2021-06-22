class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_order, only: [:index, :create]
  before_action :index_action, only: [:index, :create]

  def index
    @order_address = OrderAddress.new
  end

  def create
    binding.pry
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
     pay_photo
      @order_address.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
      params.require(:order_address).permit(:postal_code, :prefecture_id, :municipality, :address, :building, :phone_number).merge(
        user_id: current_user.id, photo_id: params[:photo_id], token: params[:token]
      )
    end
  

  def pay_photo
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: photo.params[:price],  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
  
  def set_order
    @photo = Photo.find(params[:photo_id])
  end

  def index_action
    #redirect_to root_path if current_user == @photo.user || @photo.order.present?
  end
end


