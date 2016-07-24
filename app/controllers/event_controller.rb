class EventController < ApplicationController

	def create
		@event = Event.add_new(n_params)
	end

	def show
		@event = Event.find(params[:id])
		@users = @event.users
		if(current_user)
			@user  = current_user
			@user_event = @user.events.where(id: params[:id]).last
			if @user_event == @event
				@status = true
				return @status
			else
				@status = false
				return @status
			end
		end
	end

	def index
		@events = Event.all.to_a
	end

	def destroy
       @event = Event.find_by(params[:id])
       @event.destroy
       redirect_to events_path  
    end

    def presence
    	@event = Event.find(params[:id])
    	@user  = User.find(params[:user_id])
    	status = @event.update_user(p_params)
   		return status
    end

	private
        # Never trust parameters from the scary internet, only allow the white list through.
        def n_params
          params.permit(:name, :date, :location, :description, :fees)
        end
    	
    	def p_params
    	  params.permit(:user_id, :fees, :id, :presence)
    	end

end