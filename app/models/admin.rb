# == Schema Information
#
# Table name: admins
#
#  id              :integer          not null, primary key
#  username        :string
#  password_digest :string
#  first_name      :string
#  last_name       :string
#  department      :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Admin < ActiveRecord::Base
  has_secure_password
end
