require 'test_helper'

class PaginasControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get configuraciones" do
    get :configuraciones
    assert_response :success
  end

  test "should get about" do
    get :about
    assert_response :success
  end

end
