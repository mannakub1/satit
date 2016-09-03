# == Schema Information
#
# Table name: api_keys
#
#  id           :integer          not null, primary key
#  access_token :string
#  expires_at   :datetime
#  student_id   :integer
#  active       :boolean
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  admin_id     :integer
#

class ApiKey < ActiveRecord::Base

  # attr_accessible :access_token, :expires_at, :user_id, :active, :application
  before_create :generate_access_token
  before_create :set_expiration
  belongs_to :student
  belongs_to :admin

  def expired?
    DateTime.now.utc >= self.expires_at
  end

  def expired
    self.expires_at = DateTime.now.utc
  end

  private

  def generate_access_token
    begin
      self.access_token = SecureRandom.hex
    end while self.class.exists?(access_token: access_token)
  end

  def set_expiration
    self.expires_at = DateTime.now.utc + 30.minutes
  end

end

