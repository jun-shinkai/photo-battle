require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
   end

  describe 'ユーザー新規登録'do
     context '新規登録ができるとき' do
        it 'ユーザーの情報があれば登録できる' do
           expect(@user).to be_valid
        end
     end

     context 'ユーザー新規登録ができないとき'do
        it 'nameが空では登録できない' do
          @user.name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include "Name can't be blank"
       end
        it 'emailが空では登録できない' do
           @user.email = ''
           @user.valid?
          expect(@user.errors.full_messages).to include "Email can't be blank"
        end
        it 'emailに@が存在しなければ登録できない' do
           @user.email = 'rrrrrrr'
           @user.valid?
          expect(@user.errors.full_messages).to include "Email is invalid"
        end
        it '同じメールアドレスでは登録できない' do
          @user.save
          another_user = FactoryBot.build(:user)
          another_user.email = @user.email
          another_user.valid?
          expect(another_user.errors.full_messages).to include('Email has already been taken')
        end
        it 'passwordが空では登録できない' do
          @user.password = ''
          @user.valid?
          expect(@user.errors.full_messages).to include "Password には英字と数字の両方を含めて設定してください"
        end
        it 'passwordが5文字以下だと登録できない' do
          @user.password = '11111'
          @user.valid?
          expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
        end
        it 'passwordが英語のみでは登録できない' do
          @user.password = 'aaaaa'
          @user.valid?
          expect(@user.errors.full_messages).to include "Password には英字と数字の両方を含めて設定してください"
        end
        it 'パスワードは、半角英数字混合での入力でなければ登録できない' do
          @user.password = 'あいうえおか'
          @user.valid?
          expect(@user.errors.full_messages).to include 'Password には英字と数字の両方を含めて設定してください'
        end
        it 'パスワードは、数字でのみでは登録できない' do
          @user.password = '4444444'
          @user.valid?
          expect(@user.errors.full_messages).to include 'Password には英字と数字の両方を含めて設定してください'
        end
        it 'パスワードとパスワード（確認）は、値が一致しなければ登録できない' do
          @user.password_confirmation = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end
        it 'birst_dateがなければ登録できない' do
          @user.birthday = ''
          @user.valid?
          expect(@user.errors.full_messages).to include "Birthday can't be blank"
        end
      end
    end
end
   
