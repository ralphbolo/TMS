class CreateTeamParameters < ActiveRecord::Migration
  def change
    create_table :team_parameters do |t|
      t.integer :min
      t.integer :max
      t.date :deadline
      t.string :courseCode

      t.timestamps null: false
    end
  end
end
