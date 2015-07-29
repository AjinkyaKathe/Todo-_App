require 'rails_helper'

RSpec.describe "documents/edit", :type => :view do
  before(:each) do
    @document = assign(:document, Document.create!(
      :filename => "MyString",
      :content_type => "MyString",
      :file_contents => ""
    ))
  end

  it "renders the edit document form" do
    render

    assert_select "form[action=?][method=?]", document_path(@document), "post" do

      assert_select "input#document_filename[name=?]", "document[filename]"

      assert_select "input#document_content_type[name=?]", "document[content_type]"

      assert_select "input#document_file_contents[name=?]", "document[file_contents]"
    end
  end
end
