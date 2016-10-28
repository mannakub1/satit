module Satit::Prototype::SubjectAPI

  class Get < Grape::API
    resource :subject do 

      desc 'course all'
      get :courses do
        present :courses, Teacher::SubjectList.new.courses\
        , with: Satit::SubjectAPI::CourseListEntity
      end

      desc 'course_list all in course_id'
      params do
        requires :id, type: Integer, desc: 'course_id pointer for course_list'
      end
      get :course_lists do
        present :course_list, Teacher::SubjectList.new(course_id: params[:id]).course_lists\
        , with: Satit::SubjectAPI::CourseListsListEntity
      end

      desc 'subject all in course_list_id'
      params do 
        requires :id, type: Integer, desc: 'course_list_id pointer for subjects'
      end
      get :list do
        present :subjects, Teacher::SubjectList.new(course_list_id: params[:id]).subjects\
        , with: Satit::SubjectAPI::SubjectListEntity
      end
    end
  end
end