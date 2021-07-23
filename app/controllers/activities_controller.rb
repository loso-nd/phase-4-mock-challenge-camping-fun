class ActivitiesController < ApplicationController
     #GET /activities
    def index
        #byebug
        activities = Activity.all
        render json: activities, only: [:id, :name, :difficulty]
    end

    def destroy
        activities = Activity.find_by(id: params[:id])
        if activities
            activities.destroy
            head :no_content
        else
            render json: {"error": "Activity not found"}, status: :not_found
        end
    end

end
