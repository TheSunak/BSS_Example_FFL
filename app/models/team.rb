class Team < ActiveRecord::Base
	validates_presence_of :name

	validates_numericality_of :wins_total, :loss_total

#created a function win_ratio
	def win_ratio
		
		(((self.wins_total.to_f) / (self.wins_total.to_f + self.loss_total.to_f))*100).round(2)

		#Ruby naturally returns the last line that was executed
		#do not need any other variable named win_ratio

	end

#This is a method below that is not modifying the instance of the class that was created
#this is an entirely independent method... its a Class Method. Hence the "self"

  def self.fivehundred_teams
		Team.where("((wins_total * 1.0) / (wins_total + loss_total)) > .5")
  end

end