describe TodoItem do
  before {@todo_item = FactoryGirl.create(:todo_item,:id=>"1")}

  subject{@todo_item}

  describe "when content is nil" do
    it "is invalid if content is blank" do
      @todo_item =FactoryGirl.build(:todo_item,:content => "")
      expect(@todo_item).not_to be_valid
    end
  end

  describe "when content is too longs" do
   before {@todo_item.content = "a" *100}
   it{should_not be_valid}
  end

  describe "when content is taken" do
   it "is invalid it content is duplicated" do
     @todo_item = FactoryGirl.build(:todo_item)
     todo_item_duplicate = @todo_item.content
     if todo_item_duplicate==@todo_item.content
       expect(@todo_item).not_to be_valid
     end
   end
  end
end