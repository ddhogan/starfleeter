class AssignmentsController < ApplicationController
    def index
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
    end

    private

    def assignment_params
        params.require(:assignment).permit(:name, :crew_id, :ship_id)
    end
end
