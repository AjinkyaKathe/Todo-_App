class TodoItemsController < ApplicationController
  def new
    @todo_items =TodoItem.new
  end

  def create
    @todo_list = TodoList.find(params[:todo_list_id])
    @todo_items = @todo_list.todo_items.create(todo_list_params)
    redirect_to @todo_list
  end

  def destroy
    puts params[:id]
   @todo_items=@todo_list.todo_items.find(params[:id])
    if @todo_items.destroy
       flash[:sucess] = "Todo Item was Deleted"
    else
      flash[:error] = "Not Able To Delete"
    end

  end

  private

  def set_todo_list
    @todo_list = TodoList.find(params[:todo_list_id])
  end

   def todo_list_params
     params[:todo_item].permit(:content)
   end
end
