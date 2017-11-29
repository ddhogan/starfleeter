class SessionsController < ApplicationController
    
    def welcome
    end

    def home
        @crew = Crew.find_by(id: session[:crew_id])
    end

    def new
        @crew = Crew.new
        render 'login'
    end

    def login
        @crew = Crew.find_by(name: params[:crew][:name])
        if @crew && @crew.authenticate(params[:crew][:password])
            session[:crew_id] = @crew.id
            redirect_to home_path
        else
            redirect_to login_path
        end
    end
    
    def logout
        if session[:crew_id]
            session.clear
            redirect_to 'welcome'
        else
            redirect_to 'home'
        end
    end
end