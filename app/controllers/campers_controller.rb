class CampersController < ApplicationController
    def index
        campers = Camper.all
        render json: campers, status: :ok
    end

    def show
        camper = find_camper
        render json: camper, serializer: CamperWithActivitiesSerializer, status: :ok
    end

    def create
        camper = Camper.create!(camper_params)
        render json: camper, status: :created
    end

    def update
        camper = find_camper
        camper.update!(camper_params)
        render json: camper, status: :ok
    end

    def destroy
        camper = find_camper
        camper.destroy
        head :no_content
    end

    private

    def camper_params
        params.permit(:name, :age)
    end

    def find_camper
        Camper.find(params[:id])
    end
end
