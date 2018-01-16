# == Schema Information
#
# Table name: adults
#
#  id          :integer          not null, primary key
#  first_name  :string
#  last_name   :string
#  address     :string
#  call        :string
#  zip_code    :string
#  enthicity   :string
#  district    :string
#  parish      :string
#  city        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  prefix      :string
#  nationality :string
#  iden_number :string
#  image       :string
#  thumb       :string           default("img/student/avatar.png")
#

class Adult < ActiveRecord::Base

  has_many :father_lists, dependent: :destroy
  has_many :students, through: :father_lists, source: :student

  has_many :guardians, dependent: :destroy
  has_many :students, through: :guardians, source: :student

  has_many :mother_lists, dependent: :destroy
  has_many :students, through: :mother_list, source: :student

end
