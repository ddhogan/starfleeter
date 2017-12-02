class CrewsController < ApplicationController
    
    def index
        @crews = Crew.all
    end
    
    def new
        @crew = Crew.new
    end  

    def create
        @crew = Crew.new(crew_params)
        if @crew.save
            session[:crew_id] = @crew.id
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
    end

    def update
        @crew = current_user
        @crew.update(crew_params)
        if @crew.save
            redirect_to crew_path(@crew)
        else
            redirect_to edit_crew_path(@crew), error: "Error: #{@crew.errors.full_messages.join(", ")}"
        end
    end

    def destroy
        Crew.find_by(:id => params[:id]).destroy
        flash[:notice] = "Crew record deleted."
        redirect_to crews_path
    end

    private

    def crew_params
        params.require(:crew).permit(:name, :rank, :specialty, :clearance, :password, :password_confirmation, :ship_ids => [])
    end
end
