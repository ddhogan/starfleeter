class SessionsController < ApplicationController
    before_action :require_login, only: [:logout]
    before_action :set_crew, only: [:home]

    def welcome
    end

    def home
    end

    def new
        @crew = Crew.new
        render 'login'
    end

    # only called when signing in with Facebook
    def facebook
        @crew = Crew.find_or_create_by(uid: auth['uid']) do |c|
            c.name = auth['info']['name']
            c.email = auth['info']['email']
            c.password = SecureRandom.urlsafe_base64
            c.rank ||= "Civilian"
        end
        if @crew.save
            session[:crew_id] = @crew.id
            redirect_to home_path
        else
            redirect_to root_path
        end
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
            redirect_to root_path
        else
            redirect_to home_path
        end
    end

    private

    def auth
        request.env['omniauth.auth']
    end

    def set_crew
        @crew = Crew.find_by(:id => session[:crew_id])
    end
end