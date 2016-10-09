module Satit::Prototype::TeacherAPI

  class Post < Grape::API

    resource :teacher do
      before do
       return error!('token expired', 500) unless check_token?
      end

      helpers do

        def current_student
          Student.find(params[:student_id])
        end

        def current_student_subject
          StudentSubject.find(params[:student_subject_id])
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
    end

    resource '/teacher/student' do
      before do
       return error!('token expired', 500) unless check_token?
      end

      desc 'login'
      params do 
        requires :username, type: String, desc: 'usrename teacher for login'
        requires :password, type: String, desc: 'password teacher for login'
      end
      post :login do
        present :student, Teacher::StudentAction.new(params: params).authenication\
        , with: Satit::TeacherAPI::Student::StudentListEntity
      end
    

    end
  end

end