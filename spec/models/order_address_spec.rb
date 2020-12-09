require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe "商品購入機能" do
    before do
      @order_address = FactoryBot.build(:order_address)
    end
    context "商品購入がうまくいくとき" do
      it "カード情報、郵便番号、都道府県、市町村、番地、電話番号が正しく入力されていれば保存できる" do
        expect(@order_address).to be_valid
      end
    end 
    context "商品購入がうまくいかないとき" do
      it "tokenが空だと保存できない" do
      end
      it ""
    end
  end 
end
