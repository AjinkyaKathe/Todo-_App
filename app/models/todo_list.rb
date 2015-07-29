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

  def self.import(file)
    array = Array.new
    CSV.foreach(file.path , col_sep:',') do |row |
         array.push(row[1])
      #TodoList.create! row.to_hash
    end
    i=0
    array.each_with_index do |element,index|
       i=i+1
       puts element[]
    end

  end

 #validates :title ,:presence => true ,uniqueness: true
#validates :description ,:presence => true
end
