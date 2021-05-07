require 'rails_helper'

RSpec.describe OrderPurchase, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_purchase = FactoryBot.build(:order_purchase, user_id:user.id,item_id: item.id)
    sleep 1
  end

  context '内容に問題ない場合' do

    it "priceとtokenがあれば保存ができること" do
      expect(@order_purchase.valid?).to eq true
    end
    it 'buildingがからでも保存できること' do
      @order_purchase.building = ""
      expect(@order_purchase).to be_valid
    end
  end

  context '内容に問題がある場合' do


    it "tokenが空では登録できないこと" do
      @order_purchase.token = nil
      @order_purchase.valid?
      expect(@order_purchase.errors.full_messages).to include("Token can't be blank")
    end
  
  
    it "郵便番号がないと登録できない" do
      @order_purchase.postcode = ''
      @order_purchase.valid?
      expect(@order_purchase.errors.full_messages).to include("Postcode can't be blank")
    end
  
    it "郵便番号はハイフンがないと登録できない" do
      @order_purchase.postcode = "1234567"
      @order_purchase.valid?
      expect(@order_purchase.errors.full_messages).to include("Postcode is invalid")
    end
  
    it "都道府県がないと登録できない" do
      @order_purchase.admins_information_id = 1
      expect(@order_purchase.errors.full_messages).to include()
    end
  
    it "市区町村がないと登録できない" do
      @order_purchase.city = ''
      @order_purchase.valid?
      expect(@order_purchase.errors.full_messages).to include("City can't be blank")
    end
  
    it "番地がないと登録できない" do
      @order_purchase.block = ''
      @order_purchase.valid?
      expect(@order_purchase.errors.full_messages).to include("Block can't be blank")
    end
  
    it "電話番号がないと登録できない" do
      @order_purchase.phone_number = ''
      @order_purchase.valid?
      expect(@order_purchase.errors.full_messages).to include("Phone number can't be blank")
    end

    it "電話番号が12けた以上で登録できない" do
      @order_purchase.phone_number = '123456789012'
      @order_purchase.valid?
      expect(@order_purchase.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
    end

    it "電話番号が英数混合では登録できない" do
      @order_purchase.phone_number = 'aaa123456'
      @order_purchase.valid?
      expect(@order_purchase.errors.full_messages).to include( "Phone number is not a number")
    end

    it "user_idがないと登録できない" do
      @order_purchase.user_id = ''
      @order_purchase.valid?
      expect(@order_purchase.errors.full_messages).to include("User can't be blank")
    end

    it "item_idがないと登録できない" do
      @order_purchase.item_id = ''
      @order_purchase.valid?
      expect(@order_purchase.errors.full_messages).to include("Item can't be blank")
    end

  end
end
