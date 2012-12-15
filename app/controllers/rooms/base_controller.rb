class Rooms::BaseController < ApplicationController
	before_filter :require_authentication

	private
	def room
		@room ||= Room.find(params[:id])
	end
end