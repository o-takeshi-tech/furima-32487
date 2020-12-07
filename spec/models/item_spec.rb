require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '出品がうまくいく場合' do
      it '商品名、商品説明、カテゴリー、商品状態、配送料、都道府県、配送日数、料金全ての値が入力されていると正しく出品ができる' do
        expect(@item).to be_valid
      end
    end
    context '出品がうまくいかない場合' do
      it 'imageがないと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameがないと出品できない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'descriptionがないと出品できない' do
        @item.description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'category_idで配列の1番目(---)が選択されていると出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category Select')
      end
      it 'status_idで配列の1番目(---)が選択されていると出品できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Status Select')
      end
      it 'delivery_feeで配列の1番目(---)が選択されていると出品できない' do
        @item.delivery_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery fee Select')
      end
      it 'prefecture_idで配列の1番目(---)が選択されている出品できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture Select')
      end
      it 'day_to_deliverで配列の1番目(---)が選択されていると出品できない' do
        @item.day_to_deliver_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Day to deliver Select')
      end
      it 'priceが記載されていないと出品できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが¥10,000,000以上の場合は出品できない' do
        @item.price = 100_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of setting range')
      end
      it 'priceが¥299以下の場合は出品できない' do
        @item.price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of setting range')
      end
      it 'priceが全角だと出品できない' do
        @item.price = '３３３３３３'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Half-width number')
      end
      it 'priceが半角英字だと出品できない' do
        @item.price = 'aaaaaaaa'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Half-width number')
      end
    end
  end
end
