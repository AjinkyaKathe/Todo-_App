class Document_mailer < ApplicationMailer

  def send_document(document)
   @document = document
    puts "~~~~~~~~~~~~~~~~~~~~#{@document.file_name}"
   # attachments["photo.png"] = File.read("#{Rails.root}/photo.png")
   # mail(:to => user.email  , :subject => "Successfully Registered ")
  end

end