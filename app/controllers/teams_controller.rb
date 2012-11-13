class TeamsController < ApplicationController

	 def index
		 @teams = Team.all

	    respond_to do |format|
	      format.html
	      format.json { render :json => @teams }
    	end

	 end


	  #lets us add more teams
	  def create

	    @team = Team.new

	    #Need the [:teams] because its a hash based on the post, and then
	    #within that hash, we access the [:name]
	    @team.name = params[:team][:name]
	    @team.wins_total = params[:team][:wins_total]
	    @team.loss_total = params[:team][:loss_total]
	    @team.save!

	    respond_to do |format|
	      format.html { redirect_to teams_url }
	      format.json { render :json => @team }
	    end

	  end

	 #update our teams us add more teams
	  def update
	  	@team = Team.find(params[:id])
	  	@team.wins_total = params[:team][:wins_total]
	  	@team.loss_total = params[:team][:loss_total]
	    
	    respond_to do |format|
	      format.html { redirect_to teams_url }
	      format.json { render :json => @team }
	    end

	  end

	 #gives us information about one of the teams
	 def show

	 	@team = Team.find(params[:id])

	    respond_to do |format|
	      format.html
	      format.json { render :json => @student}
	    end

	 end
		
	 #Destroys a team
	 def destroy
	 	@team = Team.find(params[:id])
	 	@team.delete

	 	respond_to do |format|
	  	  format.html { redirect_to teams_url }
	      format.json { head :ok }
	 	 end

	 end

	 #Returns all of the good students in a JSON hash
	  def fivehundred_teams
	    @teams = Team.fivehundred_teams

	    respond_to do |format|
	      format.json { render :json => @teams }
	    end
	  end

end
