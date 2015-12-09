class AddTeamParameterIdToTeam < ActiveRecord::Migration
  def change
    add_column :teams, :team_parameter_id, :integer
  end
end
