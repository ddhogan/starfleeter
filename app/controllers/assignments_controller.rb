class AssignmentsController < ApplicationController
    before_action :set_assignment, only: [:show, :edit, :update, :destroy]

    def index
        @assignments = Assignment.all
    end

    def new
        @assignment = Assignment.new
        @ship = Ship.find_by(id: params[:id])
    end

    def create
        @ship = Ship.find_by(id: params[:id])
        @assignment = Assignment.new(assignment_params)
        byebug
        if @assignment.save
            redirect_to assignment_path(@assignment)
        else
            redirect_to new_assignment_path, alert: "Error: #{@assignment.errors.full_messages.join(", ")}"
        end
    end

    def show
        if @assignment
            @ship = @assignment.ship
            @crews = @ship.crews
        else
            @ship = Ship.find_by(id: params[:id])
            redirect_to new_ship_assignment_path, notice: "That ship does not currently have an assignment, you can create one here."
        end
    end

    def edit
    end

    def update
    end

    def destroy
    end

    
    private

    def assignment_params
        params.require(:assignment).permit(:name, :description, :crew_id, :ship_id)
    end
    
    def set_assignment
        @assignment = Assignment.find_by(id: params[:id])
    end
end