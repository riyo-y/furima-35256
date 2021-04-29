require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
  @item = FactoryBot.build(:item)
end

describe '商品出品機能' do
  context '商品出品できるとき' do

it '全ての値が正しければ登録できること'do
      expect(@item.valid?).to eq true
    end
  end

    
  context '商品出品できないとき' do

it'商品画像を1枚つけないと投稿できない'do
   @item.image = 'nil'
   @item.valid?
   expect(@item.errors.full_messages).to include("Price must be an integer")
end

it'商品名がないと投稿できない'do
   @item.products_name = ''
   @item.valid?
   expect(@item.errors.full_messages).to include("Products name can't be blank")
end

it'商品の説明がないと投稿できない'do
   @item.comments = '' 
   @item.valid?
   expect(@item.errors.full_messages).to include("Comments can't be blank")
end

it'カテゴリーの情報がないと登録できない'do
   @item.category_id = ''
   @item.valid?
   expect(@item.errors.full_messages).to include( "Price must be an integer", "Category is not a number")
end

it 'カテゴリーの情報が1では登録できない'do
   @item.category_id = 1
   @item.valid?
   expect(@item.errors.full_messages).to include("Price must be an integer", "Category must be other than 1")
end

it'商品の状態についての情報がないと登録できない'do
   @item.products_states_id = ''
   @item.valid?
   expect(@item.errors.full_messages).to include("Price must be an integer", "Products states is not a number")
end

it '商品の状態についての情報が1では登録できない'do
   @item.category_id = 1
   @item.valid?
   expect(@item.errors.full_messages).to include("Price must be an integer", "Category must be other than 1")
end

it'配送料の負担についての情報がないと登録できない'do
   @item.shipping_id = ''
   @item.valid?
   expect(@item.errors.full_messages).to include("Price must be an integer", "Shipping is not a number")
end

it '配送料の負担についての情報が1では登録できない'do
   @item.category_id = 1
   @item.valid?
   expect(@item.errors.full_messages).to include("Price must be an integer", "Category must be other than 1")
end

it'発送元の地域についての情報が必須がないと登録できない'do
   @item.admins_information_id = ''
   @item.valid?
   expect(@item.errors.full_messages).to include("Admins information is not a number")
end

it '発送元の地域についての情報が1では登録できない'do
   @item.category_id = 1
   @item.valid?
   expect(@item.errors.full_messages).to include("Price must be an integer", "Category must be other than 1")
end


it'発送までの日数についての情報が必須がないと登録できない'do
   @item.arrival_date_id = ''
   @item.valid?
   expect(@item.errors.full_messages).to include("Price must be an integer", "Arrival date is not a number")
end

it '発送までの日数についての情報が1では登録できない'do
   @item.category_id = 1
   @item.valid?
   expect(@item.errors.full_messages).to include("Price must be an integer", "Category must be other than 1")
end

it'販売価格についての情報がないと登録できない'do
   @item.price = ''
   @item.valid?
   expect(@item.errors.full_messages).to include("Price can't be blank", "Price is not a number")
end

it'販売価格は、¥300~¥9,999,999の間のみでないと保存できない'do
  @item.price = 10000000
  @item.valid?
  expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
end

it  '299円以下では登録できないこと' do
   @item.price = 299
   @item.valid?
   expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
end

it'販売価格は半角数字のみでしか保存できない'do
   @item.price = '１１１１１'
   @item.valid?
   expect(@item.errors.full_messages).to include("Price is not a number")
   end
  

it  '半角英語では登録できないこと' do
   @item.price = 'aaaaa'
   @item.valid?
   expect(@item.errors.full_messages).to include("Price is not a number")
end

it  '半角英数混合では登録できないこと' do
   @item.price = '1a1a1a'
   @item.valid?
   expect(@item.errors.full_messages).to include("Price is not a number")
   end
  end
 end
end