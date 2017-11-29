class CrewsController < ApplicationController
    # TO DO: use helper methods from application controller to check if logged in before some actions
    def new
        @crew = Crew.new
    end

    def index
        @crews = Crew.all
    end

    def create
        @crew = Crew.new(crew_params)
        if @crew.save
            # TO DO: session[:crew_id] = @crew.id
            redirect_to crew_path(@crew), notice: "Crew sign up was successful."
        else
            redirect_to new_crew_path, error: "Error: #{@crew.errors.full_messages.join(", ")}"
        end
    end

    def show
        @crew = Crew.find_by(id: params[:id])
    end

    def edit
        @crew = current_user
        # TO DO: if clearance, allow editing other profiles
    end

    def update
        @crew = current_user
        # To DO: if clearance, allow editing other profiles
        @crew.update(crew_params)
        if @crew.save
            redirect_to crew_path(@crew)
        else
            redirect_to edit_crew_path(@crew), error: "Error: #{@crew.errors.full_messages.join(", ")}"
        end
    end

    private

    def crew_params
        params.require(:crew).permit(:name, :rank, :specialty, :clearance, :password, :password_confirmation)
    end
end
