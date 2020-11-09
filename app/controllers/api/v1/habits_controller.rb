class Api::V1::HabitsController < ApiController

  # ActiveRecordのレコードが見つからなければ404 not foundを応答する
  rescue_from ActiveRecord::RecordNotFound do |exception|
    render json: { error: '404 not found' }, status: 404
  end

  def index
    habits=Habit.where(user_id:current_user.id)
    render json: habits
  end

  def create
    @habit=Habit.new(habit_params)
    if @habit.save
      render json: @habit
    else

    end
  end


  private

  def habit_params
    params.require(:habit).permit(:name).merge(user_id: current_user.id)
  end
end