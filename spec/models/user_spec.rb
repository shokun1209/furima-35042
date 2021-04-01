require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end
    it '全ての項目を正しく記入できていれば登録ができる' do
      expect(@user).to be_valid
    end
    it 'ニックネームが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end
    it 'メールアドレスが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end
    it 'メールアドレスには@を含む必要がある' do
      @user.email = 'hoge'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Email is invalid'
    end
    it 'パスワードが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end
    it 'パスワードが6文字未満では登録できない' do
      @user.password = 'a1234'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Password is too short (minimum is 6 characters)'
    end
    it 'パスワードと確認用パスワードが一致しなければ登録できない' do
      @user.password = 'a12345'
      @user.password_confirmation = 'z54321'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end
    it 'パスワードは数字だけでは登録できない' do
      @user.password = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Password is invalid'
    end
    it 'パスワードは英語だけでは登録できない' do
      @user.password = 'abcdef'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Password is invalid'
    end
    it 'パスワードに全角文字は使用できない' do
      @user.password = 'A１２３４５６'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Password is invalid'
    end
    it 'ユーザー本名は名字と名前が必須' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name can't be blank"
    end
    it 'ユーザー本名は漢字、カタカナ、平仮名のみ入力可能' do
      @user.first_name = 'hoge'
      @user.valid?
      expect(@user.errors.full_messages).to include 'First name is invalid'
    end
    it 'ユーザー本名フリガナは本名と名前が必須' do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name kana can't be blank"
    end
    it 'ユーザー本名フリガナは全角カタカナのみ入力可能' do
      @user.last_name_kana = '太郎'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Last name kana is invalid'
    end
    it '生年月日が必須' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Birthday can't be blank"
    end
  end
end
