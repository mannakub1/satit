module Satit::Prototype::TeacherAPI::StudentAPI

  class Post < Grape::API

    resource :teacher do
      before do
       return error!('token expired', 500) unless check_token?
      end

      helpers do 
        def edit
          Teacher::StudentAction.new(student: current_student).edit(params)
          current_student
        end

        def add_student
          Teacher::StudentAction.new.add_student(params)
          student_last
        end

        def add_student_room
          Teacher::StudentAction.new(student: current_student).add_room(current_room)          
        end

        def add_adult
          Teacher::AdultAction.new.add(params)
        end

        def edit_adult
          Teacher::AdultAction.new.edit(params)
        end 

        def add_father
          Teacher::AdultAction.new(student: current_student).add_father(params[:adult_id])
        end

        def add_mother
          Teacher::AdultAction.new(student: current_student).add_mother(params[:adult_id])
        end

        def add_guardian
          Teacher::AdultAction.new(student: current_student).add_guardian(params[:adult_id])
        end

        def delete_student
          Teacher::StudentAction.new(student: current_student).delete_student\
        end

        def student_last
          Student.last
        end

        def current_student
          Student.find_by(id: params[:id])
        end

        def current_adult
          Adult.find_by(id: params[:adult_id])
        end

        def current_room
          Room.find_by(id: params[:room_id])
        end

      end

      desc 'edit profile studetn'
      params do 
        requires :id, type: Integer, desc: 'id each of student in database'
        requires :prefix, type: String, desc: 'prefix name of student'
        requires :code_number, type: String, desc: 'number card of student'
        requires :first_name, type: String, desc: 'frist name of student'
        requires :last_name, type: String, desc: 'last name of student'
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
      end 
      post '/edit_profile' do
        present :student, edit\
        , with: Satit::TeacherAPI::Student::StudentListEntity
      end

      desc 'add student'
      params do
        requires :code_number, type: String, desc: 'number card of student'
        requires :first_name, type: String, desc: 'frist name of student'
        requires :last_name, type: String, desc: 'last name of student'
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
      end 
      post '/add_student' do
        present :student, add_student\
        , with: Satit::TeacherAPI::Student::StudentListEntity
      end

      desc 'add adult'
      params do
        requires :id, type: Integer, desc: 'id each of student in database'
        requires :prefix, type: String, desc: 'prefix name of student'
        requires :first_name, type: String, desc: 'frist name of student'
        requires :last_name, type: String, desc: 'last name of student'
        optional :address, type: String, desc: 'address'
        optional :district, type: String, desc: 'district'
        optional :parish, type: String, desc: ''
        optional :city, type: String, desc: ''
        optional :call, type: String, desc: 'number cell phone'
        optional :zip_code, type: String, desc: 'zip code'
        optional :enthicity, type: String, desc: 'enthicity'
        optional :nationality, type: String, desc: 'nation'
      end
      post :add_adult do
        present add_adult\
        , with: Satit::TeacherAPI::Student::AdultActionAddEntity
      end

      desc 'edit adult'
      params do
        requires :prefix, type: String, desc: 'prefix name of student'
        requires :first_name, type: String, desc: 'frist name of student'
        requires :last_name, type: String, desc: 'last name of student'
        optional :address, type: String, desc: 'address'
        optional :district, type: String, desc: 'district'
        optional :parish, type: String, desc: ''
        optional :city, type: String, desc: ''
        optional :call, type: String, desc: 'number cell phone'
        optional :zip_code, type: String, desc: 'zip code'
        optional :enthicity, type: String, desc: 'enthicity'
        optional :nationality, type: String, desc: 'nation'
      end
      post :edit_adult do
        present edit_adult\
        , with: Satit::TeacherAPI::Student::AdultActionAddEntity
      end

      desc 'add adult to student'
      params do
        requires :id, type: Integer, desc: 'id of student'
        requires :adult_id, type: Integer, desc: 'id'
      end
      post :add_father do
        present add_father\
        , with: Satit::TeacherAPI::Student::AdultActionAddRelationEntity
      end

      desc 'student add relationship with father'
      params do
        requires :id, type: Integer, desc: 'id of student'
        requires :adult_id, type: Integer, desc: 'id'
      end
      post :add_mother do
        present add_mother\
        , with: Satit::TeacherAPI::Student::AdultActionAddRelationEntity
      end

      desc 'student add relationship with mother'
      params do
        requires :id, type: Integer, desc: 'id of student'
        requires :adult_id, type: Integer, desc: 'id'
      end
      post :add_guardian do
        present add_guardian\
        , with: Satit::TeacherAPI::Student::AdultActionAddRelationEntity
      end

      desc 'student add relationship with guardian'
      params do 
        requires :id, type: Integer, desc: 'id student'
        requires :room_id, type: Integer, desc: 'id room'
      end
      post '/add_student_room' do
        present add_student_room
      end

      desc 'delete student'
      params do 
        requires :id, type: Integer, desc: 'id student'
      end
      post :delete_student do
        present delete_student\
        , with: Satit::TeacherAPI::Student::StudentListEntity
      end
    end
  end


end