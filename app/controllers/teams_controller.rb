class TeamsController < ApplicationController


	def index
		@teams = Team.all
	end
	def new

		@team = Team.new
	end

	def newProf
		
		@team = Team.new
	end

	def createProf
	
		@team = Team.create(team_params)
	
		if @team.save
			redirect_to @team
		else
			render 'new'
		end
	end

	def create
		@student = current_student
		@students = Student.all 
		@team = Team.create(team_params)
		if student_signed_in? 
			@team.student_id = @student.id
		end
		if @team.save
			redirect_to @team
		else
			render 'new'
		end
	end

def show
	@team = Team.find(params[:id])
	@team_members = @team.students
	@liason = Student.find(@team.student_id)
	@team_parameter = TeamParameter.find(@team.team_parameter_id)
	@pending_members = @team.students.where(hasTeam: nil)

end

def join
	@student = current_student
	@team = Team.find(params[:id])
	@student.team_id = @team.id

	if @student.save
    flash[:notice] = "request sent"
    redirect_to @team
  else
    flash[:error] = "Unable to join."
    redirect_to root_path
  end
end

# def request
# 	#@team.Team.find(params[:id])
# end

def accept

	@student = Student.find(params[:id])
	@student.hasTeam = true

	if @student.save
    flash[:notice] = "request accepted"
    redirect_to teams_path
  else
    flash[:error] = "Unable to join."
    redirect_to root_path
  end
end


	private

	def team_params
		params.require(:team).permit(:teamName, :student_id, :team_parameter_id)
	end
end
