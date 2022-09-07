class ScientistsController < ApplicationController
    def index 
        scientist = Scientist.all 
        render json: scientist, status: :ok
    end

    def show 
        scientist = Scientist.find(params[:id])
        render json: scientist, status: :ok, serializer: ScientistWithPlanetSerializer
    end

    def create
        scientist = Scientist.create!(scientist_params)
        render json: scientist, status: :created
    end

    def update 
        scientist = Scientist.find(params[:id])
        scientist.update!(scientist_params)
        render json: scientist, status: :accepted
    end

    def destroy 
        Scientist.find(params[:id]).destroy
        head :no_content
    end

    private 

    def scientist_params 
        params.permit(:name, :field_of_study, :avatar)
    end




end
