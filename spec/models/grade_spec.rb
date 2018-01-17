# == Schema Information
#
# Table name: grades
#
#  id         :integer          not null, primary key
#  gpax       :float
#  cr         :float
#  cp         :float
#  ca         :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  student_id :integer
#  status     :string
#

require 'rails_helper'

RSpec.describe Grade, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
