module Satit::Prototype::SubjectAPI

  class Post < Grape::API

    resource :subject do
      before do
        return error!('token expired', 500) unless check_token?
      end


      helpers do 
        def course_list
          cours_list_id = params[:cours_list_id]

          params.delete(cours_list_id)
          CourseList.find(cours_list_id)
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
        requires :code, type: String, desc: 'code of subject'
        requires :hour_per_year, type: String, desc: 'time of teaching'
        requires :status, type: String, desc: 'type of subject'
        requires :credit, type: Float, desc: 'number credit of subject'
      end
      post :add do
        present :subject, Teacher::SubjectAction.new(course_list_id: params[:course_list_id]).add(new_params)\
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
    end

  end
end