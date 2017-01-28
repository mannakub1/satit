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

      desc 'return student list by year room '
      params do 
        requires :year, type: Integer, desc: 'name of  year room'
      end
      get '/student_year_room' do
        present :student, Student::StudentList.new(year: params[:year]).student_year_room \
        , with: Satit::TeacherAPI::Student::StudentListEntity
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

      desc 'search student by code number'
      params do 
        requires :code_number, type: Integer, desc: 'number identifi student'
      end
      get '/code_number' do
        present :student, Student::StudentList.new(code_number: params[:code_number]).current_student_by_code_number \
        , with: Satit::TeacherAPI::Student::StudentListEntity
      end 

      desc 'search student by first name'
      params do 
        requires :first_name, type: String, desc: 'first name of student'
      end
      get '/first_name' do
        present :student, Student::StudentList.new(first_name: params[:first_name]).current_student_by_first_name \
        , with: Satit::TeacherAPI::Student::StudentListEntity
      end 

      desc 'search student by last name'
      params do 
        requires :last_name, type: String, desc: 'last name of student'
      end
      get '/last_name' do
        present :student, Student::StudentList.new(last_name: params[:last_name]).current_student_by_last_name \
        , with: Satit::TeacherAPI::Student::StudentListEntity
      end 

    end
  end
end