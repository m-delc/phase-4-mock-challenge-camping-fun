class ActivitiesController < ApplicationController


    def index
        activities = Activity.all
        render json: activities, status: 200
    end

    def destroy
        activity = find_by_id
        if activity
            activity.destroy
            return render json: {}
        else
            return render json: { error: "Activity not found" }, status: :not_found
        end
    end

    private

    def find_by_id
        Activity.find_by(id: params[:id])
    end

end
