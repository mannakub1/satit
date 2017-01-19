module Satit::Prototype::TeacherAPI::StudentAPI

  class Get < Grape::API

    resource :student do
      before do
       return error!('token expired', 500) unless check_token?
      end

      helpers do
        def current_student
          Student.find(params[:student_id])
        end 
      end

      desc 'return course list'
      params do 
        requires :student_id, type: Integer, desc: 'id of student'
      end
      get '/courses' do 
        present :student_room, Student::SubjectList.new(student: current_student).subject_all \
        , with: Satit::StudentAPI::StudentRoomListEntity
      end

      desc 'return student'
      params do
        requires :student_id, type: Integer, desc: 'id of student'
      end
      get '/person' do 
        present :student, Teacher::StudentList.new(student_id: params[:student_id]).current_student \
        , with: Satit::TeacherAPI::Student::StudentListEntity
      end

      desc 'return student subject'
      params do
        requires :room_id, type: Integer, desc: 'id of room'
        requires :subject_id, type: Integer, desc: 'id of subject'
      end
      get '/student_subject' do
        present :student_list, Student::SubjectList.new(room_id: params[:room_id], subject_id: params[:subject_id]).current_student_subject \
        , with: Satit::StudentAPI::StudentSubjectListEntity
      end

    end
  end
end