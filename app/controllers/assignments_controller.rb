class AssignmentsController < ApplicationController
    before_action :set_assignment, only: [:show, :edit, :update, :destroy]

    def index
        @assignments = Assignment.all
    end

    def new
        @assignment = Assignment.new(ship_id: params[:ship_id])
    end

    def create
        @assignment = Assignment.create(assignment_params)
        if @assignment.save
            redirect_to ship_assignment_path(@assignment)
        else
            redirect_to new_ship_assignment_path, alert: "Error: #{@assignment.errors.full_messages.join(", ")}"
        end
    end

    def show
        if @assignment
            render :show   
        else
            redirect_to new_ship_assignment_path, notice: "That ship does not currently have an assignment, you can create one here."
        end
    end

    def edit
    end

    def update
        @assignment.update(assignment_params)
        if @assignment.save
            redirect_to ship_assignment_path(assignment)
        else
            redirect_to edit_ship_assignment_path(assignment), alert: "Error: #{@assignment.errors.full_messages.join(", ")}"
        end
    end

    def destroy
        @assignment.destroy
        flash[:notice] = "Assignment deleted."
        redirect_to ships_path
    end

    
    private

    def assignment_params
        params.require(:assignment).permit(:name, :description, :crew_id, :ship_id)
    end
    
    def set_assignment
        @assignment = Assignment.find_by(id: params[:id])
    end
end