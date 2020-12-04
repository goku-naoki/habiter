class Api::V1::HabitsController < ApiController

  def index
    
    user_habits=current_user.habit_users.preload(:habit_dones)
    render json: user_habits,each_serializer: UserHabitSerializer
  end

  def show
    user_habit=UserHabit.find(params[:id])
    render json: user_habit,serializer: UserHabitSerializer
  end


  def create
    @habit=Habit.new(name:habit_params[:name])
    if @habit.save
      
      @user_habit=UserHabit.create(user_id:current_user.id,
                       habit_id:@habit.id,
                       start_date:Time.at(habit_params[:start_date]))

      render json: @user_habit,serializer: UserHabitSerializer
    else

    end
  end

  def update
    @user_habit=UserHabit.find(params[:id])
    @habit=@user_habit.habit
    unless @habit.name==habit_params[:name]
      @habit=Habit.create(name:habit_params[:name])
    end

    @user_habit.update(
      habit_id:@habit.id,
      start_date:Time.at(habit_params[:start_date])
    )

    render json: @user_habit,serializer: UserHabitSerializer
  
  end

  def destroy
    @user_habit=UserHabit.find(params[:id])
    @user_habit.destroy
    render json: @user_habit,serializer: UserHabitSerializer
  end
  def done_habit
    
    done_habit=DoneHabit.new(user_habit_id:habit_done_params[:user_habit_id],
                             done_date:Time.at(habit_done_params[:done_date]))
                             #jsとrailsで時間が違うの変換する
    if done_habit.save
      render json: done_habit,serializer: DoneHabitSerializer
    else

    end
  end

  def undo_habit
    done_habit=DoneHabit.find_by(user_habit_id:done_habit_params[:user_habit_id],
                                 done_date:Time.at(done_habit_params[:done_date]))
    done_habit.destroy
    render json: done_habit                      
  end

  private

  def habit_params
    params.require(:habit).permit(:name,:start_date)
  end


  def done_habit_params
    params.require(:done_habit).permit(:user_habit_id,:done_date)
  end
  
end