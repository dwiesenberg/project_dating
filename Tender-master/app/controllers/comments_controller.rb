class CommentsController < ApplicationController
	before_action :require_login  
	skip_before_filter :verify_authenticity_token, :only => :count
	def chat
		@match_id = User.find(params[:id])
		@messages = Message.where(user_id:current_user.id, match_id: params[:id])
		@user = User.find(current_user.id)
	end

	def count
		Message.create(matched_id: params[:match_id], count: params[:count],user_id: current_user.id)
		render :json => { :result => true }
	end
end
