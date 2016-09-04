module Satit::Prototype::TeacherAPI

  class Post < Grape::API

    resource :teacher do
      before do
       return error!('token expired', 500) unless check_token?
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