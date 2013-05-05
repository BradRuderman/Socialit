class AnnontationsController < ApplicationController

	def book()
		id = params[:id]
		@annontations = Annontation.where("book_id = ?", id)
        render json: @annontations.to_json(:include => :user)
	end

end
