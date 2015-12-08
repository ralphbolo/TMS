class TeamsController < ApplicationController


	def index
		@teams = Team.all
	end
	def new
		@team = Team.new
	end

	def create
		@student = current_student
		@team = Team.create(team_params)
		@team.student_id = @student.id
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
	
end


	private

	def team_params
		params.require(:team).permit(:teamName)
	end
end
