class Api::V1::HabitsController < ApiController

  # ActiveRecordのレコードが見つからなければ404 not foundを応答する
  rescue_from ActiveRecord::RecordNotFound do |exception|
    render json: { error: '404 not found' }, status: 404
  end

  def index
   
    habits=current_user.habits
    render json: habits
  end

  def create
    @habit=Habit.new(habit_params)
    if @habit.save
      
      HabitUser.create(user_id:current_user.id,
                        habit_id:@habit.id)
      render json: @habit
    else

    end
  end


  private

  def habit_params
    params.require(:habit).permit(:name)
  end
end