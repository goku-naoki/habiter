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
    binding.pry
    @habit=Habit.new(name:habit_params[:name])
    if @habit.save
      
      HabitUser.create(user_id:current_user.id,
                       habit_id:@habit.id,
                       start_date:habit_params[:start_date])
                       
      render json: @habit
    else

    end
  end


  private

  def habit_params
    params.require(:habit).permit(:name,:start_date)
  end
end