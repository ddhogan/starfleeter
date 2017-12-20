class RatingsController < ApplicationController
    def new
        @rating = Rating.new
        render "/crews/:id"
    end

    def create
        @rating = Rating.new(ratings_params)
        # binding.pry
        if @rating.save
            @crew = @rating.crew_id
            redirect_to crew_path(@crew)
        else
            redirect_to crews_path
        end
    end

    def destroy
        @rating = Rating.find_by(crew_id: params[:crew_id], id: params[:id]).destroy
        redirect_to crew_path(params[:crew_id])
    end

    private
    def ratings_params
        params.require(:rating).permit(:rating, :note, :crew_id)
    end
end