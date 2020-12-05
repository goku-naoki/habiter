require 'rails_helper'

RSpec.describe Habit, type: :model do
  before do 
    @habit=build(:habit)
  end

  describe '習慣登録' do
    context '習慣登録成功' do
      it 'nameが設定されていれば保存成功' do
        expect(@habit.valid?).to eq(true)
      end
    end

    context '習慣登録登録失敗' do
      it 'nameが空だと保存失敗' do
        @habit.name=""
        @habit.valid?
        expect(@habit.errors.full_messages).to include("Nameを入力してください")
      end
    end
  end
end