  class ApiKey < ActiveRecord::Base
  before_create :generate_access_tocken

  private

  def generate_access_tocken
    begin
      self.access_tocken = SecureRandom.hex
    end while self.class.exists?(access_tocken: access_tocken)
  end

end






