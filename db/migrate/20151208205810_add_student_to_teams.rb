class AddStudentToTeams < ActiveRecord::Migration
  def change
    add_reference :teams, :student, index: true, foreign_key: true
  end
end
