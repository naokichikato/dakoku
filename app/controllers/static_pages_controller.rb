class StaticPagesController < ApplicationController
  def home
    if logged_in?
      timecard = current_user.timecards.find_by(status:1)
      timecard = current_user.timecards.find_by(status:2)
      if timecard = current_user.timecards.find_by(status:1)
        @timecard = timecard
      elsif timecard = current_user.timecards.find_by(status:2)
        @timecard = timecard
      else
        @timecard = current_user.timecards.build
      end
    else
      redirect_to "/login"
    end
  end
end
