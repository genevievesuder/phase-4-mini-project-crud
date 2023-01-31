class SpicesController < ApplicationController
    def index
        render json: Spice.all, status: :ok
    end    

    def create
        render json: Spice.create!(spice_params), status: :created
    end

    def update
        spice = Spice.find(params[:id])
        spice.update(spice_params)
        render json: spice, status: :accepted
    end

    def destroy
        Spice.destroy(params[:id])
        head :no_content
    end

    private
    def spice_params
        params.permit(:title, :image, :description, :notes, :rating)
    end

end
