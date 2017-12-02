class CrewsController < ApplicationController
    before_action :require_login, except: [:new, :create]

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
        if current_user.clearance == true
            # Admins can edit anyone's profile
            @crew = Crew.find_by(id: params[:id])
        else
            # Everyone else can only edit their own, so it redirects to their show page (redirecting to their edit page was problematic)
            redirect_to crew_path(current_user.id), notice: "Non-classified crew can only edit their own profile"
        end
    end

    def update
        if current_user.clearance == true
            @crew = Crew.find_by(id: params[:id])
        else
            @crew = current_user
        end
        
        @crew.update(crew_params)
        if @crew.save
            redirect_to crew_path(@crew)
        else
            redirect_to edit_crew_path(@crew), error: "Error: #{@crew.errors.full_messages.join(", ")}"
        end
    end

    def destroy
        if current_user.clearance == true
            Crew.find_by(:id => params[:id]).destroy
            flash[:notice] = "Crew record deleted."
            redirect_to crews_path
        else
            redirect_to crews_path, error: "This action requires clearance"
        end
    end

    private

    def crew_params
        params.require(:crew).permit(:name, :rank, :specialty, :clearance, :password, :password_confirmation, :ship_ids => [])
    end
end
