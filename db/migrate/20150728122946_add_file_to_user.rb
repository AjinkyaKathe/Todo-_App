class AddFileToUser < ActiveRecord::Migration
  def change
    add_column :users, :file_name, :string
    add_column :users, :content_type, :string
    add_column :users, :file_contents, :binary
  end
end
