class CampersController < ApplicationController

    def index
        campers = Camper.all
        render json: campers, status: 200
    end


    def show
        camper = find_by_id
        if camper
            return render json: camper, status: 200, include: :activities
        else
            return render json: { error: "Camper not found" }, status: 404
        end
    end

    # def create
    #     camper = Camper.create!(camper_params)
    #     if camper
    #         return render json: camper, status: 201
    #     else
    #         rescue ActiveRecord::RecordInvalid => e
    #         return render json: { errors: e.record.errors.full_messages }, status: 422
    #     end
    # end
    
    # def create
    #     camper = Camper.create(camper_params)
    #     render json: camper, status: 201
    # end

    def create
        camper = Camper.create!(camper_params)
        render json: camper, status: 201
    rescue ActiveRecord::RecordInvalid => e
        render json: { errors: e.record.errors.full_messages }, status: 422
    end




    private

    def find_by_id
        Camper.find_by(id: params[:id])
    end

    def camper_params
        params.permit(:name, :age)
    end

end
