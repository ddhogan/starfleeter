class CrewsController < ApplicationController
    def new
        @crew = Crew.new
    end

    def index
        @crews = Crew.all
    end

    def create
        @crew = Crew.new(crew_params)
        if @crew.save
            # session[:crew_id] = @crew.id
            redirect_to crew_path(@crew), notice: "Crew sign up was successful."
        else
            redirect_to new_crew_path, notice: "There was an error"
            # more meaningful error message needed
        end
    end

    def show
        @crew = Crew.find_by(id: params[:id])
    end

    private

    def crew_params
        params.require(:crew).permit(:name, :rank, :specialty, :clearance, :password, :password_confirmation)
    end
end
