class AnnontationsController < ApplicationController

	def book()
		id = params[:id]
		@quote = params[:quote]
		@annontations = Annontation.where("book_id = ?", id)
 		respond_to do |format|
	      format.html { render :layout => false }
	      format.json { render json: @annontations.to_json(:include => :user) }
	    end
	end

end
