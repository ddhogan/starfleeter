class ShipsController < ApplicationController
    
    def index
        @ships = Ship.all
    end

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

    def edit
        @ship = Ship.find_by(id: params[:id])
    end

    def update
        @ship = Ship.find_by(id: params[:id])
        if @ship.update(ship_params)
            redirect_to ship_path(@ship)
        else
            redirect_to edit_ship_path(@ship), error: "There was an error"
        end
    end

    private

    def ship_params
        params.require(:ship).permit(:name, :type_class, :warp_factor, :complement, :note)
    end
end
