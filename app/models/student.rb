# == Schema Information
#
# Table name: students
#
#  id              :integer          not null, primary key
#  first_name      :string
#  last_name       :string
#  gpa             :float
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  iden_number     :string
#  code_number     :string
#  room_state      :boolean
#  blood           :string
#  birthdate       :datetime
#  address         :string
#  call            :string
#  zip_code        :string
#  ability         :string
#  nationality     :string
#  ethnicity       :string
#  district        :string
#  parish          :string
#  city            :string
#  prefix          :string
#  delete_status   :string
#  username        :string
#  password_digest :string
#  image           :string
#  thumb           :string           default("")
#

class Student < ActiveRecord::Base
  has_secure_password
  
  has_many :student_rooms, dependent: :destroy
  has_many :rooms, through: :student_rooms, source: :room

  has_many :father_lists, dependent: :destroy
  has_many :father, through: :father_lists, source: :adult

  has_many :mother_lists, dependent: :destroy
  has_many :mother, through: :mother_lists, source: :adult

  has_many :guardians, dependent: :destroy
  has_many :guardian, through: :guardians, source: :adult

  has_many :student_course_lists, dependent: :destroy
  has_many :courses, through: :student_course_lists, source: :course_list

  
  require 'csv' 

  def add_student(file)
    CSV.foreach(file.path, headers: true) do |row|
      @student = Teacher::StudentAction.new().add_student(row['เลขประจำตัว'], row['ชื่อ'], row['นามสกุล'])
    end
    
  end

  def self.add_score(file)
    CSV.foreach(file.path, headers: true) do |row|
     student = Student.find_by(iden_number: row['รหัสประจําตัวประชาชน'], first_name: row['ชื่อ'], last_name: row['นามสกุล'])
     Teacher::StudentAction.new(student: student).add_score(Subject.find(2), row['คะแนนเทอม1'], row['คะแนนเทอม2'])
    end
  end

  # def add_room(student, room)
  #    Teacher::StudentAction.new().add_room(student, Room.find(1))
  # end

  # def add_subject(student, subject)
  #   Teacher::StudentAction.new().add_subject(student, Subject.find(2))
  # end

end
