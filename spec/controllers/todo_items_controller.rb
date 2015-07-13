describe TodoItemsController do

  describe 'GET #new' do

    it "assignes a new TodoItem to @todo_items" do
      get :new
      expect(assigns(:todo_item)).to be_a_new(TodoItem)
    end

  end

end


