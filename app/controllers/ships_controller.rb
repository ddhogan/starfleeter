class ShipsController < ApplicationController
    before_action :require_login
    before_action :set_ship, only: [:show, :edit, :update, :destroy]    

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
            redirect_to new_ship_path(@ship), error: "Error: #{@ship.errors.full_messages.join(", ")}"
        end
    end

    def show
        @crews = @ship.crews
    end

    def edit
    end

    def update
        if @ship.update(ship_params)
            redirect_to ship_path(@ship)
        else
            redirect_to edit_ship_path(@ship), error: "Error: #{@ship.errors.full_messages.join(", ")}"
        end
    end

    def fastest
        @ship = Ship.fastest
    end

    def destroy
        @ship.destroy
        flash[:notice] = "Ship record deleted."
        redirect_to ships_path
    end

    
    private

    def ship_params
        params.require(:ship).permit(:name, :type_class, :warp_factor, :complement, :note, :assignment_ids => [], :assignments_attributes=>[:name, :description, :crew_id, :ship_id])
    end

    def set_ship
        @ship = Ship.find_by(id: params[:id])
    end
end
