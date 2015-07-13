require 'spec_helper'

class TodoItemsControllerTest < ActionController::TestCase
  test "should get controller" do
    get :controller
    assert_response :success
  end

end
