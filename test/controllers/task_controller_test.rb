require 'test_helper'

class TaskControllerTest < ActionController::TestCase
  test "should get name" do
    get :name
    assert_response :success
  end

  test "should get complete:boolean" do
    get :complete:boolean
    assert_response :success
  end

end
