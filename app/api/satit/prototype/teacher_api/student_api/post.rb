
module Satit::Prototype::TeacherAPI::StudentAPI

  class Post < Grape::API

    resource :student do
      before do
       return error!('token expired', 500) unless check_token?
      end

      helpers do 
        
        def edit
          Teacher::StudentAction.new(student: current_student).edit(params)
        end

        def add_student
          Teacher::StudentAction.new.add_student(params)
          student_last
        end

        def add_student_room
          puts 'test call add_student_room'
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

        def student_room_delete
          Teacher::StudentAction.new(student: current_student, room: current_room, student_room: current_student_room).student_room_delete
        end

        def delete_student
          Student::StudentAction.new(student: current_student).delete\
        end

        def student_last
          Student.last
        end

        def current_room
          Room.find(params[:room_id])
        end 

        def current_student_room
          StudentRoom.find(params[:student_room_id])
        end

        def current_student
          id = params[:id]
          params.delete(:id)
          Student.find(id)
        end

        def student_id
          id = params[:id]
          params.delete(:id)

          id
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
        requires :code_number, type: String, desc: 'number card of student'
        requires :first_name, type: String, desc: 'last name of student'
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
        optional :ethnicity, type: String, desc: 'enthicity'
        optional :nationality, type: String, desc: 'nation'
        optional :image, type: String, desc: 'image for profile'
      end 
      post '/edit_profile' do
        present :student, Teacher::StudentAction.new(student_id: params[:id]).edit(params)\
        , with: Satit::TeacherAPI::Student::StudentListEntity
      end

      desc 'add student'
      params do
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
        optional :image, type: String, desc: ''
      end 
      post '/add_student' do
        present :student, Teacher::StudentAction.new.add_student(params) \
        , with: Satit::TeacherAPI::Student::StudentListEntity
      end

      desc 'add adult'
      params do
        requires :prefix, type: String, desc: 'prefix name of student'
        requires :first_name, type: String, desc: 'frist name of student'
        requires :last_name, type: String, desc: 'last name of student'
        optional :iden_number, type: String, desc: 'number card identity'
        optional :address, type: String, desc: 'address'
        optional :district, type: String, desc: 'district'
        optional :parish, type: String, desc: ''
        optional :city, type: String, desc: ''
        optional :call, type: String, desc: 'number cell phone'
        optional :zip_code, type: String, desc: 'zip code'
        optional :enthicity, type: String, desc: 'enthicity'
        optional :nationality, type: String, desc: 'nation'
        optional :image, type: String, desc: ''
      end
      post :add_adult do
        present add_adult\
        , with: Satit::TeacherAPI::Student::AdultActionAddEntity
      end

      desc 'edit adult'
      params do
        requires :id, type: Integer, desc: 'id each of adult'
        optional :prefix, type: String, desc: 'prefix name of student'
        optional :first_name, type: String, desc: 'frist name of student'
        optional :last_name, type: String, desc: 'last name of student'
        optional :iden_number, type: String, desc: 'number card identity'
        optional :address, type: String, desc: 'address'
        optional :district, type: String, desc: 'district'
        optional :parish, type: String, desc: ''
        optional :city, type: String, desc: ''
        optional :call, type: String, desc: 'number cell phone'
        optional :zip_code, type: String, desc: 'zip code'
        optional :enthicity, type: String, desc: 'enthicity'
        optional :nationality, type: String, desc: 'nation'
        optional :image, type: String, desc: ''
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
      
      desc 'delete student room'
      params do 
        requires :student_id, type: Integer, desc: 'id student'
        requires :room_id, type: Integer, desc: 'id of room'
        requires :student_room_id, type: Integer, desc: 'id of student room'
      end
      post :delete_student_room do
        present :delete, student_room_delete
      end
    end
  end


end