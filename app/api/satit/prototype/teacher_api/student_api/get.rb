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
    end

  end

end