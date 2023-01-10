class SpicesController < ApplicationController
# rescue_from ActiveRecord::RecordNotFound, with: render_error_response

    def index
        render json: Spice.all
    end

    def create
        render json: Spice.create(spice_params), status: :created
    end

    def update
        spice = find_spice
        spice.update(spice_params)
        render json: spice, status: :accepted
    end

    def destroy
        spice = find_spice
        spice.destroy
        head :no_content
    end


    private

    def find_spice
        Spice.find(params[:id])
    end

    def spice_params
        params.permit(:title, :image, :description, :notes, :rating)
    end

    def render_error_response
        render json: {error:"Spice not found"}, status: :not_found
    end


end
