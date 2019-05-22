class WorksController < ApplicationController

  def edit
  end

  def create
    @user = User.find(params[:user_id])
    @work = @user.works.find_by(day: Date.today)
    if @work.attendance_time.nil?
      @work.update_attributes(day: current_time)
      flash[:info] = 'おはようございます。'
    elsif @attendance.leaving_time.nil?
      @attendance.update_attributes(leaving_time: current_time)
      flash[:info] = 'おつかれさまでした。'
    else
      flash[:danger] = 'トラブルがあり、登録出来ませんでした。'
    end
    redirect_to @user
  end
end