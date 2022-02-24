class VotesController < ApplicationController
	load_and_authorize_resource

	def create
		@event = Event.find(params[:event_id])
		@vote = @event.votes.create(params[:vote].permit(:is_slot, :date, :slot_start, :slot_end, :temp_user_id, :temp_user_token, :temp_user_name).merge(user_id: current_user.id))
		redirect_to event_path(@event)
	end

  def destroy
		@event = Event.find(params[:event_id])
		@vote = @event.votes.find(params[:id])
		@vote.destroy
		redirect_to event_path(@event)
	end
end
