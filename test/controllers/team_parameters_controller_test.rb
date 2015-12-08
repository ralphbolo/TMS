require 'test_helper'

class TeamParametersControllerTest < ActionController::TestCase
  setup do
    @team_parameter = team_parameters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:team_parameters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create team_parameter" do
    assert_difference('TeamParameter.count') do
      post :create, team_parameter: { courseCode: @team_parameter.courseCode, deadline: @team_parameter.deadline, max: @team_parameter.max, min: @team_parameter.min }
    end

    assert_redirected_to team_parameter_path(assigns(:team_parameter))
  end

  test "should show team_parameter" do
    get :show, id: @team_parameter
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @team_parameter
    assert_response :success
  end

  test "should update team_parameter" do
    patch :update, id: @team_parameter, team_parameter: { courseCode: @team_parameter.courseCode, deadline: @team_parameter.deadline, max: @team_parameter.max, min: @team_parameter.min }
    assert_redirected_to team_parameter_path(assigns(:team_parameter))
  end

  test "should destroy team_parameter" do
    assert_difference('TeamParameter.count', -1) do
      delete :destroy, id: @team_parameter
    end

    assert_redirected_to team_parameters_path
  end
end
