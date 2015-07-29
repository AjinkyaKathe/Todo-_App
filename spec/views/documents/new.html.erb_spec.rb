require 'rails_helper'

RSpec.describe "documents/new", :type => :view do
  before(:each) do
    assign(:document, Document.new(
      :filename => "MyString",
      :content_type => "MyString",
      :file_contents => ""
    ))
  end

  it "renders new document form" do
    render

    assert_select "form[action=?][method=?]", documents_path, "post" do

      assert_select "input#document_filename[name=?]", "document[filename]"

      assert_select "input#document_content_type[name=?]", "document[content_type]"

      assert_select "input#document_file_contents[name=?]", "document[file_contents]"
    end
  end
end
