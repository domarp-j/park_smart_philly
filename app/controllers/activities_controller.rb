class ActivitiesController < ApplicationController

  def index
    @activity = Activity.new
    @activities = Activity.order(created_at: :desc).limit(20)
  end

  def create
    @activity = current_user.activities.build(strong_activity_params)
    @activity.post_time = DateTime.now # TODO: set_post_time method?

    if @activity.save
      flash[:success] = "New post created!"
    else
      flash[:error] = "Could not create a new post."
    end

    redirect_to activities_path
  end

  private

    def strong_activity_params
      params.require(:activity).permit(:body)
    end

end
