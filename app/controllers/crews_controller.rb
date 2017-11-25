class CrewsController < ApplicationController
    def new
        @crew = Crew.new
    end

    def create
        @crew = Crew.create(crew_params)
        if @crew.save
            redirect_to crew_path(@crew), notice: "Crew sign up was successful."
        # else
        #     redirect_to new_crew_path, notice: "There was an error, please try again"
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
