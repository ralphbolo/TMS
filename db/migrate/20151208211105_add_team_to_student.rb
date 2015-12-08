class AddTeamToStudent < ActiveRecord::Migration
  def change
    add_reference :students, :team, index: true, foreign_key: true
  end
end
