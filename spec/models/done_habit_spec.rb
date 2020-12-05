
require 'rails_helper'

RSpec.describe DoneHabit, type: :model do
  before do 
    @done_habit=build(:done_habit)
  end

  describe '習慣完了' do
    context '習慣完了成功' do
      it 'nameが設定されていれば保存成功' do
        expect(@done_habit.valid?).to eq(true)
      end
    end

    context '習慣完了失敗' do
      it 'user_habit_idが空だと保存失敗' do
        @done_habit.user_habit=nil
        @done_habit.valid?
        expect(@done_habit.errors.full_messages).to include("User habitを入力してください")
      end
      it 'start_dateが空だと保存失敗' do
        @done_habit.done_date=nil
        @done_habit.valid?
        expect(@done_habit.errors.full_messages).to include("Done dateを入力してください")
      end
    end
  end
end