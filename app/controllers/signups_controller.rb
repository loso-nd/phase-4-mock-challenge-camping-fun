class SignupsController < ApplicationController
    #POST /signups/
    def create
        signup = Signup.create(camper_id: params[:camper_id], activity_id: params[:activity_id], time: params[:time])

        activity = Activity.find_by(id: params[:activity_id],)
        if activity
            render json: activity, status: :created
        else 
            # render json: {errors: signup.errors.full_messages}, status: :unprocessable_entity
            render json: {"errors": delivery.errors}, status: :unprocessable_entity
        end
        
    end

end
