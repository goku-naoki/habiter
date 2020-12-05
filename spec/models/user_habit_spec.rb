require 'rails_helper'

RSpec.describe UserHabit, type: :model do
  before do 
    @user_habit=build(:user_habit)
  end

  describe 'ユーザー習慣登録' do
    context 'ユーザー習慣登録成功' do
      it 'nameが設定されていれば保存成功' do
        expect(@user_habit.valid?).to eq(true)
      end
    end

    context 'ユーザー習慣登録登録失敗' do
      it 'user_idが空だと保存失敗' do
        @user_habit.user=nil
        @user_habit.valid?
        expect(@user_habit.errors.full_messages).to include("Userを入力してください")
      end
      it 'habit_idが空だと保存失敗' do
        @user_habit.habit=nil
        @user_habit.valid?
        expect(@user_habit.errors.full_messages).to include("Habitを入力してください")
      end
      it 'start_dateが空だと保存失敗' do
        @user_habit.start_date=nil
        @user_habit.valid?
        expect(@user_habit.errors.full_messages).to include("Start dateを入力してください")
      end
    end
  end
end