class ShipsController < ApplicationController
    before_action :require_login
    before_action :set_ship, only: [:show, :edit, :update, :destroy]    

    def index
        @ships = Ship.all
        # render json: @ships
        respond_to do |format|
            format.json { render json: @ships }
            format.html { render :index }
        end
    end

    def new
        @ship = Ship.new
    end

    def create
        @ship = Ship.new(ship_params)
        if @ship.save
            redirect_to ship_path(@ship)
            # redirect_to home_path
        else
            redirect_to new_ship_path(@ship), error: "Error: #{@ship.errors.full_messages.join(", ")}"
            # redirect_to home_path, error: "Error: #{@ship.errors.full_messages.join(", ")}"
        end
    end

    def show
        @ship = Ship.find_by_id(params[:id])
        @crews = @ship.crews
        # render json: @ship
        respond_to do |format|
            format.json { render json: @ship }
            format.html { render :show }
        end

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
