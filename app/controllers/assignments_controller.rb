class AssignmentsController < ApplicationController
    before_action :set_ship, only: [:new, :show, :create, :edit, :update, :destroy]
    before_action :set_assignment, only: [:destroy]

    def index
        @assignments = Assignment.all
    end

    def new
        @assignment = Assignment.new(ship_id: params[:ship_id])
    end

    def create
        @assignment = Assignment.new(assignment_params)
        if @assignment.save
            redirect_to ship_assignments_path(@ship)
        else
            redirect_to new_ship_assignment_path, alert: "Error: #{@assignment.errors.full_messages.join(", ")}"
        end
    end

    def show
        @assignment = Assignment.find_by(:ship_id => params[:ship_id])
        if @assignment
            render :show   
        else
            redirect_to new_ship_assignment_path, notice: "That ship does not currently have an assignment, create one here."
        end
    end

    def edit
        @assignment = Assignment.find_by(:ship_id => params[:ship_id], :id => params[:id])
    end

    def update
        @assignment = Assignment.find_by(:ship_id => params[:ship_id], :id => params[:id])
        if @assignment.update(assignment_params)
            redirect_to ship_assignment_path(@assignment)
        else
            redirect_to edit_ship_assignment_path(@assignment), alert: "Error: #{@assignment.errors.full_messages.join(", ")}"
        end
    end

    def destroy
        @assignment.destroy
        flash[:notice] = "Assignment deleted."
        redirect_to assignments_path
    end

    
    private

    def assignment_params
        params.require(:assignment).permit(:name, :description, :crew_id, :ship_id)
    end
    
    def set_assignment
        @assignment = Assignment.find_by(:id => params[:id])
    end

    def set_ship
        @ship = Ship.find_by(id: params[:ship_id])
    end
end