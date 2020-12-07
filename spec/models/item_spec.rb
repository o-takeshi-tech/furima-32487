require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe "商品出品機能" do
    context "出品がうまくいく場合" do
      it "商品名、商品説明、カテゴリー、商品状態、配送料、都道府県、配送日数、料金全ての値が入力されていると正しく出品ができる" do
        @item.valid?
      end
    end
    context "出品がうまくいかない場合" do
      it "画像がないと出品できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "商品名がないと出品できない" do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "商品説明がないと出品できない" do
        @item.description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it "カテゴリーが選択されていないと出品できない" do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category Select")
      end
      it "商品状態が選択されていないと出品できない" do
        @item.status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Status Select")
      end
      it "配送料が選択されていないと出品できない" do
        @item.delivery_fee_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee Select")
      end
      it "発送元地域が選択されていないと出品できない" do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture Select")
      end
      it "発送までの日数が選択されていないと出品できない" do
        @item.day_to_deliver = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Day to deliver Select")
      end
      it "価格が記載されていないと出品できない" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "価格の範囲が¥300~¥9,999,999でないと出品できない" do
        @item.price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end
      it "販売価格が全角だと出品できない" do
        @item.price = "３３３３３３"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Half-width number")
      end
      it "販売価格が半角英字だと出品できない" do
        @item.price ="aaaaaaaa"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Half-width number")
      end
    end 
  end 
end
