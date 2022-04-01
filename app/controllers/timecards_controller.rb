class TimecardsController < ApplicationController
  before_action :logged_in_user, only: [:create, :update, :destroy]

  def index
  end

  def create
    work_begin = Time.now
    status = 1
    @timecard = current_user.timecards.build(work_begin: work_begin, status:status)
    if @timecard.save
      redirect_to root_url
    else
      redirect_to root_url
    end
  end

  def update
    @timecard = current_user.timecards.find(params[:id])
    last_status = @timecard.status
    status = timecard_params[:status].to_i 
    if last_status == 1 && status == 2
      rest_begin = Time.now
      #@timecard.update(timecard_params)
      if @timecard.update(status:status, rest_begin:rest_begin)
      else
        render 'home'
      end
    elsif last_status == 2 && status != 3
      #@timecard.update(timecard_params)
      rest_finish = Time.now
      rest_time = rest_finish - @timecard.rest_begin
      rest_time += @timecard.rest_time
      if @timecard.update(status:status, rest_finish:rest_finish, rest_time:rest_time)
      else
        render 'home'
      end
    elsif status == 3
      work_finish = Time.now 
      work_begin = @timecard.work_begin
      #@timecard.update(timecard_params)
      work_time = work_finish-work_begin-@timecard.rest_time #秒
      if overtime = work_time - 12*60*60 < 0  
        overtime = 0  
      end
      if @timecard.update(status:status, work_finish:work_finish, work_time:work_time, overtime:overtime)
      else
        render 'home'
      end
    end
    redirect_to root_url
  end

  def destroy
  end

  def search
    @user = User.find(params[:id])
    if params["work_begin(1i)"].empty?
      #年が全てである
      @timecards = @user.timecards.paginate(page: params[:page])
      @date = "全て"
      #flash[:success] = "年が全て"
    else
      if params["work_begin(2i)"].empty? 
        #年が指定され、月が全てである
        search_date ="#{params["work_begin(1i)"]}-1-1".in_time_zone.all_year
        @timecards = @user.timecards.where(work_begin:search_date).paginate(page: params[:page])
        @date = "#{params["work_begin(1i)"]}年"
        #flash[:success] = "年が指定され、月が全てである"
      else 
        #年が指定され、月も指定
        search_date ="#{params["work_begin(1i)"]}-#{params["work_begin(2i)"]}-1".in_time_zone.all_month
        @timecards = @user.timecards.where(work_begin:search_date).paginate(page: params[:page])
        @date = "#{params["work_begin(1i)"]}年#{params["work_begin(2i)"]}月"       
        #flash[:success] = "年が指定され、月もである"
      end
    end
    @day_sum = @timecards.count
    @rest_time_sum = change(@timecards.sum(:rest_time))
    @work_time_sum = change(@timecards.sum(:work_time))
    @overtime_sum = change(@timecards.sum(:overtime))
    render 'users/show'
  end

  def show
    @user = User.find(params[:id])
    @timecards = @user.timecards.paginate(page: params[:page])
  end

  private

    def timecard_params
      params.require(:timecard).permit(:status)
    end
end
