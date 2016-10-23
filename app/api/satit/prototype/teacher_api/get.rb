module Satit::Prototype::TeacherAPI

  class Get < Grape::API
    
    resource :teacher do 
      before do
        return error!('token expired', 500) unless check_token?
      end

      helpers do

        def student_list
          current_room.students.order(:code_number)
        end

        def current_room
          Room.find(params[:room_id])
        end 

        def student
          current_student
        end

        def current_student
          Student.find(params[:id])
        end

      end

      

      desc 'return student list'
      params do 
        requires :room_id, type: Integer, desc: 'room_id'
      end
      get '/students' do
        present :student_list, student_list \
        , with: Satit::TeacherAPI::Student::StudentListEntity
      end

      desc 'return student all'
      get '/student_all' do
        present :student_list, Student.all\
        , with: Satit::TeacherAPI::Student::StudentListEntity
      end

      desc 'return student all'
      get '/student' do
        present :student, student\
        , with: Satit::TeacherAPI::Student::StudentListEntity
      end
    end

  end

end