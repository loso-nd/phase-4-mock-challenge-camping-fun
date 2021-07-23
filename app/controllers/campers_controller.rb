class CampersController < ApplicationController

    #GET /campers/ 
    def index
        #byebug
        campers = Camper.all
        render json: campers, only: [:id, :name, :age]
    end

    #GET /campers/:id
    def show
        #byebug
        camper = Camper.find_by(id: params[:id])
        if camper
            render json: camper, only: [:id, :name, :age], include: :activities
        else 
            render json: {"error": "Camper not found"}, status: :not_found
        end
    end
            
    #POST /campers
    def create
        camper = Camper.create(name: params[:name], age: params[:age])
        if camper
            render json: camper, status: :created
        else 
            render json: {"errors": ["validation errors"]}, status: :not_found
        end
        
    end

end
