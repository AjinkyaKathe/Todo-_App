class UserMailer < ApplicationMailer

  def registration_confirmation(user)
    @user = user
    # File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
    #   file.write(uploaded_io.read)
    # end
    attachments["photo.png"] = File.read("#{Rails.root}/photo.png")
    #file = Document.last.url
    mail(:to => user.email  , :subject => "Successfully Registered ")


  end

end
