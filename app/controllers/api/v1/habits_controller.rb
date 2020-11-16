class Api::V1::HabitsController < ApiController

  # ActiveRecordのレコードが見つからなければ404 not foundを応答する
  rescue_from ActiveRecord::RecordNotFound do |exception|
    render json: { error: '404 not found' }, status: 404
  end

  def index
    habits=current_user.habits
    render json: habits,include: { habit_users: [:habit_dones] },each_serializer: HabitSerializer
  end

  def show
    habit_user=HabitUser.find(params[:id])
    render json: habit_user,serializer: HabitUserSerializer
  end


  def create
    @habit=Habit.new(name:habit_params[:name])
    if @habit.save
      
      HabitUser.create(user_id:current_user.id,
                       habit_id:@habit.id,
                       start_date:Time.at(habit_params[:start_date]))

      render json: @habit
    else

    end
  end

  def habit_done
    
    habit_done=HabitDone.new(habit_user_id:habit_done_params[:habit_user_id],
                             done_date:Time.at(habit_done_params[:done_date]))
                             #jsとrailsで時間が違うの変換する
    if habit_done.save
      render json: habit_done,serializer: HabitDoneSerializer
    else

    end
  end

  def habit_undo
    habit_done=HabitDone.find_by(habit_user_id:habit_done_params[:habit_user_id],
                                 done_date:Time.at(habit_done_params[:done_date]))
    habit_done.destroy
    render json: habit_done                      
  end

  private

  def habit_params
    params.require(:habit).permit(:name,:start_date)
  end

  def habit_done_params
    params.require(:habit_done).permit(:habit_user_id,:done_date)
  end
end