require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe '新規登録' do
    context '新規登録できる時' do
      it 'nicknameとemail、passwordとpassword_confirmation、last_name、first_name、last_name_kana、first_name_kana、birth_dayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できない時' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include "Email has already been taken"
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '00000'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name can't be blank"
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end
      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana can't be blank"
      end
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana can't be blank"
      end
      it 'birth_dayが空では登録できない' do
        @user.birth_day = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Birth day can't be blank"
      end
      it 'passwordは英字のみでは保存できない' do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it 'password数字のみでは保存できない' do
        @user.password = '222222'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it 'password全角英数混合では保存できない' do
        @user.password = '２２２aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it 'emailは@含まなければ保存できない' do
        @user.email = 'aaagmail'
        @user.valid?
        expect(@user.errors.full_messages).to include "Email is invalid"
      end
      it 'last_nameは全角（漢字・ひらがな・カタカナ）でなければ保存できない' do
        @user.last_name = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name is invalid"
      end
      it 'first_nameは全角（漢字・ひらがな・カタカナ）でなければ保存できない' do
        @user.first_name = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include "First name is invalid"
      end
      it 'last_name_kanaは全角（カタカナ）でなければ保存できない' do
        @user.last_name_kana = 'あああ'
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana is invalid"
      end
      it 'first_name_kanaは全角（カタカナ）でなければ保存できない' do
        @user.first_name_kana = 'あああ'
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana is invalid"
      end
    end
  end
end
