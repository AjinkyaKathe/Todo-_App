describe TodoListsController do

 describe 'GET #index' do
    context 'with params' do
      it "populates @todo_list" do
        todo_list=FactoryGirl.create(:todo_list,:title =>"ABCd")
        get :index , id: todo_list.to_param
        expect(assigns(:todo_list)) == todo_list
      end
      it "renders the :index template" do
        todo_list =FactoryGirl.create(:todo_list)
        get :index
        expect(response).to render_template :index
      end
      end
 end

  describe 'GET #show' do
      it "assigns the requested list to todo_list" do
          todo_list = FactoryGirl.create(:todo_list,:title => "Abcd")
          get :show, id: todo_list.to_param
          expect(assigns(:todo_list)).to eq todo_list
      end
      it "renders to :show" do
        todo_list = FactoryGirl.create(:todo_list,:title => "Abcd")
        get :show, id: todo_list.to_param
        expect(response).to render_template :show
      end
  end


   describe 'GET #new' do
      it "assigns new TodoList to @todo_list" do
        get :new
        expect(assigns(:todo_list)).to be_a_new(TodoList)
      end
      it "rendes to :new template" do
        get :new
        expect(response).to render_template :new
      end

   end

   describe 'GET #edit' do
     it "assign the requested contact to @todo_list" do
        todo_list = FactoryGirl.create(:todo_list)
        get :edit , id:todo_list.to_param
       expect(assigns(:todo_list)).to eq(todo_list)
     end
      it "renders to the :edit template" do
        todo_list = FactoryGirl.create(:todo_list)
        get :edit ,id:todo_list
        expect(response).to render_template :edit
      end

   end


   describe 'POST #create' do
      context "with valid parameters" do
        it "saves todo_list into database" do
          expect{
          post :create , todo_list: FactoryGirl.attributes_for(:todo_list)
          }.to change(TodoList,:count).by(1)

        end
        it "renders to :new_template" do
          post :create ,todo_list: FactoryGirl.attributes_for(:todo_list)
          expect(response ).to redirect_to todo_list_path(assigns[:todo_list])
        end

    end

     context "with invalid parameter" do
         it "does not save new TodoList into database" do
           expect{
             post :create,
                   todo_list: FactoryGirl.attributes_for(:invalid_todo_list)
           }.to_not change(TodoItem, :count)
         end

=begin
        it "renders to the :new_template" do
          post :create , todo_list: FactoryGirl.attributes_for(:todo_list)
          expect(response).to render_template :new
        end
=end
     end

   end

   describe 'POST #update' do
       context "with valid parameters" do
         before :each do
           @todo_list =FactoryGirl.create(:todo_list,title: 'Friday Night')
         end
           it "locates the requested @todo_list" do
            patch :update ,id:@todo_list , todo_list: FactoryGirl.attributes_for(:todo_list)
             expect(assigns (:todo_list)).to eq(@todo_list)
           end

         it "change the @todo_list attributes" do
              patch :update,id:@todo_list,
                    todo_list: FactoryGirl.attributes_for(:todo_list,title:'Kumbha mela')
              @todo_list.reload
           expect(@todo_list.title).to eq('Kumbha mela')
         end

           it "renders to :new_template" do
             patch :update ,id:@todo_list,todo_list: FactoryGirl.attributes_for(:todo_list)
             expect(response).to redirect_to @todo_list
           end
       end

=begin
     context "with invalid paramaters" do
           it "does not change the contact's attributes" do
             patch :update ,id:@todo_list.to_param,
                   todo_list: FactoryGirl.attributes_for(:todo_list,title:'Company')
                   @todo_list.reload
             expect(@todo_list.title).to_not eq('Company')
           end
          it "renders to the #edit template" do
            patch :update ,id:@todo_list.to_param,
            todo_list: FactoryGirl.attributes_for(:invalid_todo_list)
            expect(response).to redirect_to :edit
          end
     end
=end
   end

   describe 'DELETE #destroy' do
     before :each do
      @todo_list =FactoryGirl.create(:todo_list)
     end
        it "deletes the contact from the database" do
          expect{delete :destroy ,id: @todo_list}.to change(TodoList,:count).by(-1)
        end
         it "redierect to todo_list #index" do
           delete :destroy ,id:@todo_list
           expect(response).to redirect_to :todo_lists
         end
   end

end