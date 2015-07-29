class User < ActiveRecord::Base
  #Validations

  def initialize(params = {})
    # File is now an instance variable so it can be
    # accessed in the validation.

    @file = params.delete(:file)
    super
    if @file
      self.filename = @file.original_filename
      self.content_type = @file.content_type
      self.file_contents = @file.read
    end
  end

end
