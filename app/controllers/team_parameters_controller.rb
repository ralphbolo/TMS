class TeamParametersController < ApplicationController
  before_action :set_team_parameter, only: [:show, :edit, :update, :destroy]

  # GET /team_parameters
  # GET /team_parameters.json
  def index
    @team_parameters = TeamParameter.all
  end

  # GET /team_parameters/1
  # GET /team_parameters/1.json
  def show
  end

  # GET /team_parameters/new
  def new
    @team_parameter = TeamParameter.new
  end

  # GET /team_parameters/1/edit
  def edit
  end

  # POST /team_parameters
  # POST /team_parameters.json
  def create
    @team_parameter = TeamParameter.new(team_parameter_params)

    respond_to do |format|
      if @team_parameter.save
        format.html { redirect_to @team_parameter, notice: 'Team parameter was successfully created.' }
        format.json { render :show, status: :created, location: @team_parameter }
      else
        format.html { render :new }
        format.json { render json: @team_parameter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /team_parameters/1
  # PATCH/PUT /team_parameters/1.json
  def update
    respond_to do |format|
      if @team_parameter.update(team_parameter_params)
        format.html { redirect_to @team_parameter, notice: 'Team parameter was successfully updated.' }
        format.json { render :show, status: :ok, location: @team_parameter }
      else
        format.html { render :edit }
        format.json { render json: @team_parameter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /team_parameters/1
  # DELETE /team_parameters/1.json
  def destroy
    @team_parameter.destroy
    respond_to do |format|
      format.html { redirect_to team_parameters_url, notice: 'Team parameter was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team_parameter
      @team_parameter = TeamParameter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def team_parameter_params
      params.require(:team_parameter).permit(:min, :max, :deadline, :courseCode)
    end
end
