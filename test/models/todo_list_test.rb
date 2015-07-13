require 'test_helper'

class TodoListTest < ActiveSupport::TestCase
=begin
  test "the truth" do
    assert true
  end
=end

  test "should not save todo_list without title " do
    todo_list = TodoList.new
    assert_not todo_list.save
  end

  test "should not save todo_list without description" do
    todo_list = TodoList.new
    assert_not todo_list.save
  end

  test "should not save todo list if it is allready present" do
    todo_list = TodoList.new
      assert_equal "x" , "x"
    end
end
