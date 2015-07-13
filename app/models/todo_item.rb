class TodoItem < ActiveRecord::Base
  belongs_to :todo_list

 validates :content ,presence: true,uniqueness:true,length: { maximum: 500 }

end
