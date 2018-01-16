require 'rails_helper'


pathname = Pathname.new(__FILE__)
RSpec.describe "[Service: #{pathname.dirname.basename}/#{pathname.basename}]\n\n Teacher::SubjectAction" do


  context '#approve: calculated gpax' do
    before(:context) do
      @student_id = 72
      @student_rooms = StudentRoom.where(student_id: @student_id)
      @teacher_subject = Teacher::SubjectAction.new(student_rooms: @student_rooms)
      # @teacher_subject_update_gpa = Teacher::SubjectAction.new(student_rooms: @student_rooms).update_gpa
      # @teacher_subject_update_gpax 
    end

    it '- Called a method update gpa' do
      expect(@student_rooms).to eq(@teacher_subject.update_gpa)
    end

    # it '- Called a method update gpax' do
    #   expect(@teacher_subject.test_process_update_gpa).to eq(@teacher_subject.update_gpa)
    # end

    it '- Called a method update gpax' do 

    end

  end
end