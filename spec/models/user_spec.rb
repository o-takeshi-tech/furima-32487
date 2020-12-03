require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end 

  describe "ユーザー新規登録" do
    context '新規登録がうまくいくとき' do
      it 'ニックネーム、Email、パスワード、姓、名、姓(カタカナ),名(カタカナ)、誕生日の全てが揃っていると新規登録ができる' do
      end 
    end 
    context '新規登録が出来ない時' do
      it "ニックネームが空だと登録できない" do
      end 
      it "メールアドレスが空だと登録できない" do
      end 
      it "重複したメールアドレスがあると登録できない" do
      end 
      it "メールアドレスに@がないと登録できない" do
      end 
      it "パスワードが空だと登録できない" do
      end 
      it "パスワードが6文字以下だと登録できない" do
      end 
      it "パスワードが半角英数字混合でないと登録できない" do
      end 
      it "パスワードを2回入力しないと登録できない" do
      end 
      it "パスワードが確認用パスワードと一致しないと登録できない" do
      end 
      it "ユーザー本名の姓が空だと登録できない" do
      end 
      it "ユーザー本名の名が空だと登録できない" do
      end 
      it "ユーザー本名の姓と名が全角（漢字・ひらがな・カタカナ）でないと登録できない" do
      end 
      it "ユーザー本名の名が全角（漢字・ひらがな・カタカナ）でないと登録できない" do
      end 
      it "ユーザー本名のフリガナ（姓)が空だと登録できない" do
      end 
      it "ユーザー本名のフリガナ（名)が空だと登録できない" do
      end 
      it "生年月日が空だと登録できない" do
      end     
    end 
  end 
end
