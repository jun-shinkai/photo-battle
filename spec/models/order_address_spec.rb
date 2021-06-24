require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @photo = FactoryBot.create(:photo)
    @order = FactoryBot.build(:order_address, user_id: @user.id, photo_id: @photo.id)
    sleep 0.1
  end

  
  describe '商品購入' do
    context '商品購入ができるとき' do
      it '商品の情報が正常であれば登録できる' do
        expect(@order).to be_valid
      end
      it 'buildingが空でも登録できる' do
        @order.building = ''
        expect(@order).to be_valid
      end
    end

    context '商品購入がができないとき' do
      it 'postal_codeが空だと登録できない' do
        @order.postal_code = nil
        binding.pry
        @order.valid?
        expect(@order.errors.full_messages).to include "Postal code can't be blank"
      end
      it 'postal_codeは「3桁ハイフン4桁」の半角文字列以外だと登録できない' do
        @order.postal_code = '3333333'
        @order.valid?
        expect(@order.errors.full_messages).to include 'Postal code is invalid'
      end

      it 'prefecture_idが空では登録できない' do
        @order.prefecture_id = ''
        @order.valid?
        expect(@order.errors.full_messages).to include "Prefecture can't be blank"
      end
      it 'prefecture_idが0だと登録できない' do
        @order.prefecture_id = 0
        @order.valid?
        expect(@order.errors.full_messages).to include "Prefecture can't be blank"
      end

      it 'municipalityが空だと登録できない' do
        @order.municipality = ''
        @order.valid?
        expect(@order.errors.full_messages).to include "Municipality can't be blank"
      end
      it 'addressが空では登録できない' do
        @order.address = ''
        @order.valid?
        expect(@order.errors.full_messages).to include "Address can't be blank"
      end
      it 'phone_numberが空だと登録できない' do
        @order.phone_number = ''
        @order.valid?
        expect(@order.errors.full_messages).to include "Phone number can't be blank"
      end
      it 'phone_numberが9桁以下だと登録できない' do
        @order.phone_number = '000000000'
        @order.valid?
        expect(@order.errors.full_messages).to include 'Phone number is invalid'
      end
      it 'phone_numberが12桁以上だと登録できない' do
        @order.phone_number = '000000000000'
        @order.valid?
        expect(@order.errors.full_messages).to include 'Phone number is invalid'
      end
      it 'phone_numberが英数混合だと登録できない' do
        @order.phone_number = 'aaaaa0000000'
        @order.valid?
        expect(@order.errors.full_messages).to include 'Phone number is invalid'
      end
      it 'phone_numberが数字のみでないと登録できない' do
        @order.phone_number = '123-4567-0000'
        @order.valid?
        expect(@order.errors.full_messages).to include 'Phone number is invalid'
      end
      it 'phone_numberが全角数字だと登録できない' do
        @order.phone_number = '０００００００００００'
        @order.valid?
        expect(@order.errors.full_messages).to include 'Phone number is invalid'
      end
      it 'ユーザーが紐付いていなければ投稿できない' do
        @order.user_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include "User can't be blank"
      end
      it 'photo_idが紐付いていなければ投稿できない' do
        @order.photo_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include "Photo can't be blank"
      end
      it 'tokenが空では投稿できない' do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include "Token can't be blank"
      end
    end
  end
end

  