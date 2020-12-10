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
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      it "郵便番号が空だと保存できない" do
        @order_address.postal_code = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it "郵便番号にハイフンがないと保存できない" do
        @order_address.postal_code = "1111111"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code Input correctly")
      end
      it "郵便番号がハイフン前に3数字、ハイフン後に4数字でないと保存できない" do
        @order_address.postal_code = "1111-111"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code Input correctly")
      end
      it "都道府県が配列の1番(--)を選択されていると保存できない" do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture Select")
      end
      it "市町村が空だと保存できない" do
        @order_address.city = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it "番地が空だと保存できない" do
        @order_address.address_line = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address line can't be blank")
      end
      it "携帯番号が空だと保存できない" do
        @order_address.phone_number = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it "携帯番号が半角英字だと保存できない" do
        @order_address.phone_number = "abcdefg"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number  Input only number")
      end
      it "携帯番号が全角かなだと保存できない" do
        @order_address.phone_number = "ああああああああ"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number  Input only number")
      end
      it "携帯番号が全角カナだと保存できない" do
        @order_address.phone_number = "アアアアアア"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number  Input only number")
      end
      it "携帯番号が全角漢字だと保存できない" do
        @order_address.phone_number = "一一一一一一一"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number  Input only number")
      end
    end
  end 
end
