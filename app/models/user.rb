class User < ActiveRecord::Base
  #Validations
  has_attached_file :document,
                    :styles => {
                        :thumb => "50x50>",
                        :small => "150x150>"
                    },
                    #:path => '/home/it184/Project/Todo_app/non_public/images.jpeg',
                    #:url => 'users/4/download'
                    :path => ':rails_root/non-public/system/:attachment/:id/:style/:basename.:extension',
                    :url => ':class/:id/:attachment?style=:style/:basename.:extension'


  # def initialize(params = {})
  #   # File is now an instance variable so it can be
  #   # accessed in the validation.
  #
  #   @file = params.delete(:file)
  #   super
  #   if @file
  #     self.filename = @file.original_filename
  #     self.content_type = @file.content_type
  #     self.file_contents = @file.read
  #   end
  # end



end
