class Api::V1::HabitsController < ApiController

  def index
    
    habit_users=current_user.habit_users.preload(:habit_dones)
    render json: habit_users,each_serializer: HabitUserSerializer
  end

  def show
    habit_user=HabitUser.find(params[:id])
    render json: habit_user,serializer: HabitUserSerializer
  end


  def create
    @habit=Habit.new(name:habit_params[:name])
    if @habit.save
      
      @habit_user=HabitUser.create(user_id:current_user.id,
                       habit_id:@habit.id,
                       start_date:Time.at(habit_params[:start_date]))

      render json: @habit_user,serializer: HabitUserSerializer
    else

    end
  end

  def update
    @habit_user=HabitUser.find(params[:id])
    @habit=@habit_user.habit
    unless @habit_user.habit.name==habit_params[:name]
      @habit=Habit.create(name:habit_params[:name])
    end

    @habit_user.update(
      habit_id:@habit.id,
      start_date:Time.at(habit_params[:start_date])
    )

    render json: @habit_user,serializer: HabitUserSerializer
  
  end

  def destroy
    @habit_user=HabitUser.find(params[:id])
    @habit_user.destroy
    render json: @habit_user,serializer: HabitUserSerializer
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