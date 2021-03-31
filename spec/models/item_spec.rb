require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  it '全ての項目正しく入力されていれば商品が出品できる' do
    expect(@item).to be_valid
  end
  it '商品名が無ければ出品できない' do
    @item.name = ''
    @item.valid?
    expect(@item.errors.full_messages).to include "Name can't be blank"
  end
  it '商品画像が無ければ出品できない' do
    @item.image = nil
    @item.valid?
    expect(@item.errors.full_messages).to include "Image can't be blank"
  end
  it '商品説明が無ければ出品できない' do
    @item.text = ""
    @item.valid?
    expect(@item.errors.full_messages).to include "Text can't be blank"
  end
  it '商品状態の情報が無ければ出品できない' do
    @item.status_id = ""
    @item.valid?
    expect(@item.errors.full_messages).to include "Status can't be blank"
  end
  it '送料の負担についての情報が無ければ出品できない' do
    @item.shipping_id = ""
    @item.valid?
    expect(@item.errors.full_messages).to include "Shipping can't be blank"
  end
  it '発送元の地域についての情報が無ければ出品できない' do
    @item.area_id = ""
    @item.valid?
    expect(@item.errors.full_messages).to include "Area can't be blank"
  end
  it '発送までの日数についての情報が無ければ出品できない' do
    @item.days_id = ""
    @item.valid?
    expect(@item.errors.full_messages).to include "Days can't be blank"
  end
  it '販売価格299円以下は登録できない' do
    @item.price = 299
    @item.valid?
    expect(@item.errors.full_messages).to include "Price must be greater than 299"
  end
  it '販売価格10,000,000以上は登録できない' do
    @item.price = 10_000_000
    @item.valid?
    expect(@item.errors.full_messages).to include "Price must be less than 10000000"
  end
  it '販売価格は半角数字のみ保存可能' do
    @item.price = '５０００'
    @item.valid?
    expect(@item.errors.full_messages).to include "Price is not a number"
  end
  it 'カテゴリーの項目が --- の場合は登録できない' do
    @item.category_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include "Category must be other than 1"
  end
  it '商品状態の項目が --- の場合は登録できない' do
    @item.status_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include "Status must be other than 1"
  end
  it '送料の項目が --- の場合は登録できない' do
    @item.shipping_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include "Shipping must be other than 1"
  end
  it '発送元の地域の項目が --- の場合は登録できない' do
    @item.area_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include "Area must be other than 1"
  end
  it '発送までの日数の項目が --- の場合は登録できない' do
    @item.days_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include "Days must be other than 1"
  end
end
