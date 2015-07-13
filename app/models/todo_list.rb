class TodoList < ActiveRecord::Base
  has_many :todo_items

  def name_with_initial
     "#{content}"
  end

 #validates :title ,:presence => true ,uniqueness: true
#validates :description ,:presence => true
end
