class Team < ActiveRecord::Base

	has_many :students
	has_one :team_parameter
end
