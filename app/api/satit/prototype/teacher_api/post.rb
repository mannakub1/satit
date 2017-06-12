module Satit::Prototype::TeacherAPI

  class Post < Grape::API

    resource :teacher do
      before do
       return error!('token expired', 500) unless check_token?
      end

      helpers do

        def file_add_student
          params[:students].each do |student|
            Teacher::StudentAction.new.add_student(student)
            Teacher::StudentAction.new(student: Student.last).add_room(current_room)
          end

          true
        end 

        def current_room
          Room.find(params[:room_id])
        end

        def current_student
          Student.find(params[:student_id])
        end

        def current_student_subject
          StudentSubject.find(params[:student_subject_id])
        end
          
        def new_params
          params.delete(:id)

          params
        end
      end

      desc 'login'
      params do 
        requires :username, type: String, desc: 'usrename teacher for login'
        requires :password, type: String, desc: 'password teacher for login'
      end
      post :login do
        present :teacher, Teacher::TeacherAction.new(params: params).authenication\
        , with: Satit::TeacherAPI::TeacherActionEntity
      end

      desc 'edit score student'
      params do 
        requires :student_id, type: Integer, desc: 'id of student'
        requires :student_subject_id, type: Integer, desc: 'id of student subject'
        requires :score1, type: Integer, desc: 'number is change score1'
        requires :score2, type: Integer, desc: 'number is change scroe2'
        optional :grade, type: String, desc: ''
      end
      post :edit_score do
        present Teacher::SubjectAction.new(student: current_student, student_subject: current_student_subject)\
        .edit_score(params[:score1], params[:score2])\
        , with: Satit::StudentAPI::StudentRoomListEntity
      end

      desc 'add student from file'
      params do
          requires :students, type: Array do 
            optional :prefix, type: String, desc: 'prefix name of student'
            optional :code_number, type: String, desc: 'number card of student'
            optional :first_name, type: String, desc: 'frist name of student'
            optional :last_name, type: String, desc: 'last name of student'
            optional :iden_number, type: String, desc: 'number card identity'
            optional :blood, type: String, desc: 'blood'
            optional :birthdate, type: DateTime, desc: 'birthdate'
            optional :address, type: String, desc: 'address'
            optional :district, type: String, desc: 'district'
            optional :parish, type: String, desc: ''
            optional :city, type: String, desc: ''
            optional :call, type: String, desc: 'number cell phone'
            optional :zip_code, type: String, desc: 'zip code'
            optional :ability, type: String, desc: 'student can it'
            optional :ethnicity, type: String, desc: 'enthicity'
            optional :nationality, type: String, desc: 'nation'
          end
          requires :room_id, type: Integer, desc: 'register student in room'
      end 
      post '/file_add_student' do
        present :status_add_student, file_add_student
      end

      desc 'add teacher'
      params do
        requires :first_name, type: String, desc: 'first name of teacher'
        requires :last_name, type: String, desc: 'last name of teacher'
        requires :username, type: String, desc: 'usernaem of teacher for login'
        requires :password, type: String, desc: 'password of teacher for login'
        requires :status, type: String, desc: 'type for permisstion'
      end
      post :add do
        present Teacher::TeacherAction.new.add(params)\
        , with: Satit::TeacherAPI::TeacherActionEntity
      end

      desc 'delete teacher'
      params do
        requires :id, type: Integer, desc: 'id of teacher'
      end
      post :delete do
        present Teacher::TeacherAction.new(teacher_id: params[:id]).delete
      end

      desc 'edit profile'
      params do
        requires :first_name, type: String, desc: 'first name of teacher'
        requires :last_name, type: String, desc: 'last name of teacher'
        requires :username, type: String, desc: 'usernaem of teacher for login'
        requires :password, type: String, desc: 'password of teacher for login'
        requires :status, type: String, desc: 'type for permisstion'
      end
      post :edit_profile do
        present Teacher::TeacherAction.new.edit(params)\
        , with: Satit::TeacherAPI::TeacherActionEntity
      end

      desc 'teacher edit password'
      params do
        requires :id, type: Integer, desc: 'id of teacher'
        requires :password, type: String, desc: 'password of teacher for login'
      end
      post :edit_password do
        present Teacher::TeacherAction.new(teacher_id: params[:id]).edit_password(new_params)\
        , with: Satit::TeacherAPI::TeacherActionEntity
      end
    end

    resource '/teacher/student' do
      before do
       return error!('token expired', 500) unless check_token?
      end

      desc 'login student'
      params do 
        requires :username, type: String, desc: 'usrename teacher for login'
        requires :password, type: String, desc: 'password teacher for login'
      end
      post :login do
        present :student, Student::StudentAction.new(params: params).authenication\
        , with: Satit::TeacherAPI::Student::StudentListEntity
      end
    

    end
  end

end