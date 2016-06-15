# == Schema Information
#
# Table name: students
#
#  id         :integer          not null, primary key
#  first_name :string
#  last_name  :string
#  gpa        :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Student < ActiveRecord::Base
  
  has_many :student_rooms, dependent: :destroy
  has_many :rooms, through: :student_rooms, source: :room

  has_many :student_subjects, dependent: :destroy
  has_many :subjects, through: :student_subjects, source: :subject

  require 'csv' 

  def self.add_student(file)
    CSV.foreach(file.path, headers: true) do |row|
      student = Teacher::StudentAction.new(nil).add_student(row['รหัสประจําตัวประชาชน'], row['ชื่อ'], row['นามสกุล'])
      Teacher::StudentAction.new(student).add_room(Room.find(1))
      Teacher::StudentAction.new(student).add_subject(Subject.find(2))
      # add_room(student, Room.find(1))
      # add_subject(student, Room.find(2))
    end
  end

  def self.add_score(file)
    CSV.foreach(file.path, headers: true) do |row|
     student = Student.find_by(iden_number: row['รหัสประจําตัวประชาชน'], first_name: row['ชื่อ'], last_name: row['นามสกุล'])
     Teacher::StudentAction.new(student).add_score(Subject.find(2), row['คะแนนเทอม1'], row['คะแนนเทอม2'])
    end
  end

  # def add_room(student, room)
  #    Teacher::StudentAction.new().add_room(student, Room.find(1))
  # end

  # def add_subject(student, subject)
  #   Teacher::StudentAction.new().add_subject(student, Subject.find(2))
  # end

end
