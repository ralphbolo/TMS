class AddHasTeamToStudent < ActiveRecord::Migration
  def change
    add_column :students, :hasTeam, :boolean
  end
end
