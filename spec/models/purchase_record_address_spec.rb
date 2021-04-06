require 'rails_helper'

RSpec.describe PurchaseRecordAddress, type: :model do
  before do
    @purchase_record = FactoryBot.build(:purchase_record_address)
  end
  context '購入ができる時' do
    it '全ての項目を正しく入力できていれば商品が購入できる' do
      expect(@purchase_record).to be_valid
    end
    it '建物名は記入しなくても購入ができる' do
      @purchase_record.building = ''
      expect(@purchase_record).to be_valid
    end
  end
  context '購入ができない時' do
    it 'カード情報が正しくなければ登録できない' do
      @purchase_record.token = ''
      @purchase_record.valid?
      expect(@purchase_record.errors.full_messages).to include "Token can't be blank"
    end
    it '郵便番号がなければ購入できない' do
      @purchase_record.postal_code = ''
      @purchase_record.valid?
      expect(@purchase_record.errors.full_messages).to include "Postal code can't be blank"
    end
    it '郵便番号は半角数字のみ使用可能' do
      @purchase_record.postal_code = '123-456a'
      @purchase_record.valid?
      expect(@purchase_record.errors.full_messages).to include "Postal code is invalid"
    end
    it '郵便番号は3桁-4桁の構成のみ使用可能' do
      @purchase_record.postal_code = '1234-567'
      @purchase_record.valid?
      expect(@purchase_record.errors.full_messages).to include "Postal code is invalid"
    end
    it '郵便番号はハイフンが無ければ商品を購入できない' do
      @purchase_record.postal_code = 12345678
      @purchase_record.valid?
      expect(@purchase_record.errors.full_messages).to include "Postal code is invalid"
    end
    it '都道府県が選択されていなければ商品を購入できない' do
      @purchase_record.area_id = ''
      @purchase_record.valid?
      expect(@purchase_record.errors.full_messages).to include "Area can't be blank"
    end
    it '都道府県は{ --- }を選択できない' do
      @purchase_record.area_id = 1
      @purchase_record.valid?
      expect(@purchase_record.errors.full_messages).to include "Area must be other than 1"
    end
    it '市区町村が空では商品を購入できない' do
      @purchase_record.municipality = ''
      @purchase_record.valid?
      expect(@purchase_record.errors.full_messages).to include "Municipality can't be blank"
    end
    it '番地が空では商品を購入できない' do
      @purchase_record.address = ''
      @purchase_record.valid?
      expect(@purchase_record.errors.full_messages).to include "Address can't be blank"
    end
    it '電話番号が無ければ商品を購入できない' do
      @purchase_record.tell = ''
      @purchase_record.valid?
      expect(@purchase_record.errors.full_messages).to include "Tell can't be blank"
    end
    it '電話番号に全角数字は使用できない' do
      @purchase_record.tell = '０９０１２３４５６７８'
      @purchase_record.valid?
      expect(@purchase_record.errors.full_messages).to include "Tell is invalid"
    end
    it '電話番号に英語は使用できない' do
      @purchase_record.tell = 'abc12345678'
      @purchase_record.valid?
      expect(@purchase_record.errors.full_messages).to include "Tell is invalid"
    end
    it '電話番号は11桁以内のみ登録可能' do
      @purchase_record.tell = '090123456789'
      @purchase_record.valid?
      expect(@purchase_record.errors.full_messages).to include "Tell is invalid"
    end
  end
end
