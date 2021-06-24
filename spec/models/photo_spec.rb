require 'rails_helper'

RSpec.describe Photo, type: :model do
   before do
    @photo = FactoryBot.build(:photo)
    end
  
  describe '商品出品' do
    context '商品出品ができるとき' do
      it '商品の情報が正常であれば登録できる' do
        expect(@photo).to be_valid
      end
    end

    context '商品出品がができないとき' do
      it 'Title_imageが空だと登録できない' do
        @photo.title_image = nil
        @photo.valid?
        expect(@photo.errors.full_messages).to include "Title image can't be blank"
      end
      it 'titleが空では登録できない' do
        @photo.title = ''
        @photo.valid?
        expect(@photo.errors.full_messages).to include "Title can't be blank"
      end
      it 'infoが空では登録できない' do
        @photo.info = ''
        @photo.valid?
        expect(@photo.errors.full_messages).to include "Info can't be blank"
      end
      it 'category_idは、が存在しなければ登録できない。' do
        @photo.category_id = ''
        @photo.valid?
        expect(@photo.errors.full_messages).to include "Category can't be blank"
      end

      it 'sales_status_id が空では登録できない' do
        @photo.sales_status_id = ''
        @photo.valid?
        expect(@photo.errors.full_messages).to include "Sales status can't be blank"
      end
      it 'shipping_fee_status_idが空だと登録できない' do
        @photo.shipping_fee_status_id = ''
        @photo.valid?
        expect(@photo.errors.full_messages).to include "Shipping fee status can't be blank"
      end
      it ' prefecture_idが空だと登録できない' do
        @photo.prefecture_id = ''
        @photo.valid?
        expect(@photo.errors.full_messages).to include "Prefecture can't be blank"
      end
      it 'scheduled_delivery_id ' do
        @photo.scheduled_delivery_id = ''
        @photo.valid?
        expect(@photo.errors.full_messages).to include "Scheduled delivery can't be blank"
      end
      it 'price が空だと登録できない' do
        @photo.price = ''
        @photo.valid?
        expect(@photo.errors.full_messages).to include "Price can't be blank"
      end
      it 'price が300以下だと登録できない' do
        @photo.price = 299
        @photo.valid?
        expect(@photo.errors.full_messages).to include 'Price must be greater than 299'
      end
      it 'price が9,999,999以上だと登録できない' do
        @photo.price = '10000000'
        @photo.valid?
        expect(@photo.errors.full_messages).to include 'Price must be less than 10000000'
      end
      it 'price が半角数字以外だと登録できない' do
        @photo.price = 'fwrfw'
        @photo.valid?
        expect(@photo.errors.full_messages).to include 'Price is not a number'
      end
      it 'category_id が0だと登録できない' do
        @photo.category_id = 0
        @photo.valid?
        expect(@photo.errors.full_messages).to include 'Category must be other than 0'
      end
      it 'sales_status_id が0だと登録できない' do
        @photo.sales_status_id = 0
        @photo.valid?
        expect(@photo.errors.full_messages).to include 'Sales status must be other than 0'
      end
      it 'shipping_fee_status_id が0だと登録できない' do
        @photo.shipping_fee_status_id = 0
        @photo.valid?
        expect(@photo.errors.full_messages).to include 'Shipping fee status must be other than 0'
      end
      it 'prefecture_id  が0だと登録できない' do
        @photo.prefecture_id = 0
        @photo.valid?
        expect(@photo.errors.full_messages).to include 'Prefecture must be other than 0'
      end
      it 'scheduled_delivery_id が0だと登録できない' do
        @photo.scheduled_delivery_id = 0
        @photo.valid?
        expect(@photo.errors.full_messages).to include 'Scheduled delivery must be other than 0'
      end
      it 'ユーザーが紐付いていなければ投稿できない' do
        @photo.user = nil
        @photo.valid?
        expect(@photo.errors.full_messages).to include('User must exist')
      end
    end
  end
end
