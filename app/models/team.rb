class Team < ActiveRecord::Base
	validates_presence_of :name

	validates_numericality_of :wins_total

	validates_numericality_of :loss_total

end