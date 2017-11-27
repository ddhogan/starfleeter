class SessionsController < ApplicationController
    
    def home
    end

    def new
        @crew = Crew.new
        render 'login'
    end

    def login
        @crew = Crew.find_by(name: params[:crew][:name])
        if @crew && @crew.authenticate(params[:crew][:password])
            session[:crew_id] = @crew.id
            redirect_to crew_path(@crew)
        else
            redirect_to login_path
        end
    end
    
    def logout
    end
end