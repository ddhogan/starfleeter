class AssignmentsController < ApplicationController
    # set assignment before show, edit, update, destroy

    def index
        @assignments = Assignment.all
    end

    def new
        @assignment = Assignment.new
    end

    def create
        @assignment = Assignment.new(assignment_params)
        if @assignment.save
            redirect_to assignment_path(@assignment)
        else
            redirect_to new_assignment_path, error: "There was an error"
        end
    end

    def show
        @assignment = Assignment.find_by(id: params[:id])
        @ship = @assignment.ship
        @crews = @ship.crews
    end

    def edit
        @assignment = Assignment.find_by(id: params[:id])
    end

    def update
        @assignment = Assignment.find_by(id: params[:id])
    end

    def destroy
        @assignment = Assignment.find_by(id: params[:id])
    end

    private

    def assignment_params
        params.require(:assignment).permit(:name, :description, :crew_id, :ship_id)
    end
end
