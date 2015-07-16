class TodoList < ActiveRecord::Base
  has_many :todo_items

  def name_with_initial
     "#{content}"
  end

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |todo_list|
        csv << todo_list.attributes.values_at(*column_names)
      end
    end
  end

 #validates :title ,:presence => true ,uniqueness: true
#validates :description ,:presence => true
end
