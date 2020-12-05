require 'rails_helper'

RSpec.describe User, type: :model do
  before do 
    @user=build(:user)
  end

  describe 'ユーザー登録' do
    context '新規登録成功' do
      it 'email,nicknameとpasswordが設定されていれば保存成功' do
        expect(@user.valid?).to eq(true)
      end
    end

    context '新規登録失敗' do
      it 'emailが空だと保存失敗' do
        @user.email=""
        @user.valid?
        expect(@user.errors.full_messages).to include("メールアドレスが入力されていません。")
      end
      it 'nicknameが空だと保存失敗' do
        @user.nickname=""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nicknameを入力してください")
      end
      it 'passwordが空だと保存失敗' do
        @user.password=""
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードが入力されていません。")
      end
    end
  end
end