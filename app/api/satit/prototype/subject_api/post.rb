module Satit::Prototype::SubjectAPI

  class Post < Grape::API

    resource :subject do
      before do
        origin
        return error!('token expired', 500) unless check_token?
      end


      helpers do 
        def course_list
          cours_list_id = params[:cours_list_id]

          params.delete(cours_list_id)
          CourseList.find(cours_list_id)
        end

        def params_without_id
          params.delete(:id)

          params
        end

        def new_params
          params.delete(:course_list_id)

          params
        end
      end 

      desc 'add subject in course'
      params do 
        requires :course_list_id, type: Integer, desc: 'id of course_list'
        requires :name, type: String, desc: 'name of subject'
        optional :code, type: String, desc: 'code of subject'
        requires :hour_per_year, type: String, desc: 'time of teaching'
        requires :status, type: String, desc: 'type of subject'
        optional :credit, type: Float, desc: 'number credit of subject'
      end
      post :add do
        present :subject, Teacher::SubjectAction.new(course_list_id: params[:course_list_id]).add(new_params)\
        , with: Satit::SubjectAPI::SubjectListEntity
      end

      desc 'edit subject in course'
      params do 
        requires :id, type: Integer, desc: 'id of subject'
        requires :name, type: String, desc: 'name of subject'
        requires :code, type: String, desc: 'code of subject'
        requires :hour_per_year, type: String, desc: 'time of teaching'
        requires :status, type: String, desc: 'type of subject'
        requires :credit, type: Float, desc: 'number credit of subject'
      end
      post :edit do
        present :subject, Teacher::SubjectAction.new(subject_id: params[:id]).edit(params_without_id)\
        , with: Satit::SubjectAPI::SubjectListEntity
      end

      desc 'delete teacher course in subject'
      params do 
        requires :subject_id, type: Integer, desc: 'id of subject'
        requires :teacher_id, type: Integer, desc: 'id of teacher'
      end
      post :delete_teacher do 
        present Teacher::SubjectAction.new(subject_id: params[:subject_id]).delete_teacher(params[:teacher_id])
      end

      desc 'delete teacher course in subject'
      params do 
        requires :subject_id, type: Integer, desc: 'id of subject'
        requires :teacher_id, type: Integer, desc: 'id of teacher'
      end
      post :add_teacher do 
        present Teacher::SubjectAction.new(subject_id: params[:subject_id]).add_teacher(params[:teacher_id])
      end

      desc 'add course room in course_list'
      params do 
        requires :course_list_id, type: Integer, desc: 'id of course_list'
        requires :room_id, type: Integer, desc: 'id of room'
      end
      post :add_room do 
        present Teacher::SubjectAction.new(course_list_id: params[:course_list_id]).add_room(params[:room_id])
      end

      desc 'add course '
      params do 
        requires :year, type: Integer, desc: 'year of course'
      end
      post :add_course do 
        present Teacher::CourseAction.new.add(params)
      end

      desc 'delete subject out of course_list'
      params do
        requires :course_list_id, type: Integer, desc: 'id of course_list'
        requires :subject_id, type: Integer, desc: 'id of subject'
      end
      post :delete do 
        present Student::SubjectAction.new(course_list_id: params[:course_list_id]).delete_subject(params[:subject_id])
      end

      desc 'delete subject out of course_list'
      params do
        requires :course_list_id, type: Integer, desc: 'id of course_list'
        requires :room_id, type: Integer, desc: 'id of subject'
      end
      post :delete_room do 
        present Student::SubjectAction.new(course_list_id: params[:course_list_id]).delete_room(params[:room_id])
      end


    end

  end
end