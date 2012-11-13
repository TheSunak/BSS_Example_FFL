class CreateTeamTable < ActiveRecord::Migration
  def up

  	create_table :teams do |t|
  		t.string :name
  		t.integer :wins_total
  		t.integer :loss_total
  	end

  end

end
