module Satit::Prototype::SubjectAPI

  class Post < Grape::API

    resource :subject do

      helpers do 
        def course_list
          cours_list_id = params[:cours_list_id]

          params.delete(cours_list_id)
          CourseList.find(cours_list_id)
        end
      end 

      desc 'add subject in course'
      params do 
        requires :courst_list_id, type: Integer, desc: 'id of course_list'
        requires :name, type: String, desc: 'name of subject'
        requires :code, type: String, desc: 'code of subject'
        requires :hour_per_year, type: String, desc: 'time of teaching'
        requires :type, type: String, desc: 'type of subject'
        requires :credit, type: Float, desc: 'number credit of subject'
      end
      post :add do
        present Teacher::SubjectAction.new(course_list: course_list).add(params)\
        , with: Satit::SubjectAPI::SubjectListEntity
      end

    end

  end
end