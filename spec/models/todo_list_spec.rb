require 'spec_helper'

describe TodoList do
 before{@todo_list = FactoryGirl.create(:todo_list,:id => 1)}

   it "is invalid if title is taken" do
     @todo_list = FactoryGirl.build(:todo_list)
     todo_list_with_duplicate_title = @todo_list.dup
     if todo_list_with_duplicate_title.title == @todo_list.title
         expect(@todo_list).not_to be_valid
     else
       expect(@todo_list).to be_valid
     end
   end


  it "is invalid without title" do
    @todo_list=FactoryGirl.build(:todo_list,:title =>"")
    expect(@todo_list).not_to be_valid
  end

  it "is invalid if title is too long" do
    @todo_list.title = ("a" * 40)
    expect (@todo_list).should_not be_valid
  end

end



