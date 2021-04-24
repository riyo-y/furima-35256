require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  
  
  
  describe 'ユーザー新規登録' do


    context '新規登録できるとき' do

    it'パスワードは６文字以上であれば登録できること'do
    @user.password = '123456'
      @user.password_confirmation = '123456'
     expect(@user).to be_valid
  end

  it'パスワードは半角英数字が混合されていれば登録できること'do
  @user.password = '1q1q1q'
      @user.password_confirmation = '1q1q1q'
     expect(@user).to be_valid
  end
end



  context '新規登録できないとき' do

     it 'ニックネームがないと登録できない事'do
     @user.nickname = ''
     @user.valid?
     expect(@user.errors.full_messages).to include("Nickname can't be blank")
  end   


     it 'メールアドレスがないと登録できない事' do
      @user.email = ''  # emailの値を空にする
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    
    it 'メールアドレスが一意性でないと登録できない事'do
       @user.save
       another_user = FactoryBot.build(:user, email: @user.email)
       another_user.valid?
       expect(another_user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'メールアドレスは＠を含まないと登録できない事'do
    @user.email = 'aa.com'  # emailの値を空にする
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid", "Password confirmation doesn't match Password")
    end

    it'パスワードが無いと登録できない事'do
    @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

it'パスワードは６文字以上での入力がないと登録できない事'do
      @user.password = '12345'
      @user.password_confirmation = '12345'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
end

it'パスワードは半角英数字混合での入力でないと登録できない事'do
      @user.password = '111111'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
end

it'パスワードは、確認用を含めて2回入力しないと登録できない事'do
       @user.password = '123456'
       @user.password_confirmation = ''
       @user.valid?
       expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
end

it'パスワードとパスワード（確認用）は、値の一致しないと登録できない事'do
       @user.password = '123456'
       @user.password_confirmation = '1234567'
       @user.valid?
       expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
end

it'ユーザー本名は、名字がないと登録できないこと'do
     @user.last_name = ''
     @user.valid?
     expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Last name can't be blank")
end

it'ユーザー本名は、名前がないと登録できない事'do
    @user.first_name = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "First name can't be blank")
end


it'ユーザー名字は、全角（漢字・ひらがな・カタカナ）での入力がないと登録できないこと'do
@user.last_name = ''
@user.valid?
expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Last name can't be blank")
end

it'ユーザー名前は、全角（漢字・ひらがな・カタカナ）での入力がないと登録できないこと'do
@user.first_name = ''
@user.valid?
expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "First name can't be blank")
end


it'ユーザー本名のフリガナは、名字がないと登録できない事'do 
   @user.last_name_kana = ''
   @user.valid?
   expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Last name kana can't be blank")
end

it'ユーザー本名のフリガナは、名前がないと登録できない事'do
    @user.first_name_kana = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "First name kana can't be blank")
end

it'ユーザー名字のフリガナは、全角（カタカナ）での入力がないと登録できない事'do
     @user.last_name_kana = ''
     @user.valid?
    expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Last name kana can't be blank")
end


it'ユーザー名前のフリガナは、全角（カタカナ）での入力がないと登録できない事'do
     @user.first_name_kana = ''
     @user.valid?
     expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "First name kana can't be blank")
end

it'生年月日がないと登録できない事'do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
     end
    end
  end
end
