class ShipsController < ApplicationController
    def new
        @ship = Ship.new
    end

    def create
        @ship = Ship.new(ship_params)
        if @ship.save
            redirect_to ship_path(@ship)
        else
            redirect_to new_ship_path
        end
    end

    def show
        @ship = Ship.find_by(id: params[:id])
    end

    private

    def ship_params
        params.require(:ship).permit(:name, :type_class, :warp_factor, :complement, :note)
    end
end
