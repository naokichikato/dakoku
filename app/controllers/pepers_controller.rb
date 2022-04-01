class PepersController < ApplicationController
  
  def index
    @pepers = Peper.where(status:"申請中").paginate(page: params[:page])
  end

  def create
    @user = User.find(params[:id])
    peper = @user.pepers.build(kind:params[:kind],status:"申請中")
    #peper = current_user.pepers.build(kind:params[:kind],status:"申請中")
    if peper.save
      #redirect_to root_url
      @pepers = @user.pepers.paginate(page: params[:page])
      render 'users/peper'
    else
      redirect_to actiom:new
    end 
  end

  def update
    @peper = Peper.find(params[:id])
    if @peper.update(status: params[:status])
      flash[:success] = "#{params[:status]}しました"
      redirect_to pepers_path
    else
      redirect_to pepers_path
    end
  end

end
