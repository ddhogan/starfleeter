class AssignmentsController < ApplicationController
    before_action :require_login
    before_action :set_ship, only: [:edit, :update]
    before_action :set_assignment, only: [:show, :edit, :update]

    def index
        @assignments = Assignment.all
        if params[:ship_id]
            @assignment = Assignment.new(ship_id: params[:ship_id])
        else
            @assignment = Assignment.new
        end
    end

    def new
        @assignment = Assignment.new(ship_id: params[:ship_id])
    end

    def create
        @assignment = Assignment.new(assignment_params)
        if @assignment.save
            respond_to do |format|
                format.json { render json: @assignment }
                format.html { render :show }
            end
        else
            redirect_to new_assignment_path, alert: "Error: #{@assignment.errors.full_messages.join(", ")}"
        end
    end

    def show
        if @assignment
            respond_to do |format|
                format.html { render :show }
                format.json { render json: @assignment}
            end
        else
            redirect_to new_assignment_path, notice: "That ship does not currently have an assignment, create one here."
        end
    end

    def edit
    end

    def update
        if @assignment.update(assignment_params)
            redirect_to ship_assignment_path(params[:assignment][:ship_id])
        else
            redirect_to edit_ship_assignment_path(@assignment), alert: "Error: #{@assignment.errors.full_messages.join(", ")}"
        end
    end

    def destroy
        Assignment.find_by(:id => params[:id]).destroy
        flash[:notice] = "Assignment deleted."
        redirect_to assignments_path
    end

    
    private

    def assignment_params
        params.require(:assignment).permit(:name, :description, :crew_id, :ship_id)
    end
    
    def set_assignment
        @assignment = Assignment.find_by(:ship_id => params[:ship_id], :id => params[:id])
    end

    def set_ship
        @ship = Ship.find_by(id: params[:ship_id])
    end
end