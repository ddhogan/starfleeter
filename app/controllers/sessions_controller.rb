class SessionsController < ApplicationController
    before_action :require_login, only: [:logout]

    def welcome
    end

    def home
        @crew = Crew.find_by(:id => session[:crew_id])
    end

    def new
        @crew = Crew.new
        render 'login'
    end

    # only called when signing in with Twitter
    def create
        @crew = Crew.find_or_create_by(uid: auth[:uid]) do |u|
            u.name = auth[:info][:name]
            u.email = auth[:info][:email]
            u.image = auth[:info][:image]
            u.password = SecureRandom.urlsafe_base64
        end
        
        @crew.name ||= "unknown name"
        @crew.rank ||= "unknown rank"
        @crew.save

        session[:crew_id] = @crew.id
        redirect_to home_path, notice: "Please confirm that your information is up to date by visiting the Edit Profile page"
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
end