module Satit::Prototype::SubjectAPI

  class Get < Grape::API
    resource :subject do 
      before do
        return error!('token expired', 500) unless check_token?
      end

      helpers do 
        def courses 
          Teacher::SubjectList.new.courses
        end

      end

      desc 'course all'
      get :courses do
        present :courses, courses.order(:id)\
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

      desc 'room all in course_list_id'
      params do 
        requires :id, type: Integer, desc: 'course_list_id pointer for subjects'
      end
      get :rooms do
        present :rooms, Teacher::SubjectList.new(course_list_id: params[:id]).course_rooms\
        , with: Satit::RoomAPI::RoomEntity
      end

      desc 'subject onec'
      params do 
        requires :id, type: Integer, desc: 'id of subject'
      end
      get :by_ids do
        present :subject, Teacher::SubjectList.new(subject_id: params[:id]).subject_by_ids\
        , with: Satit::SubjectAPI::SubjectListEntity
      end

      desc 'teacher all in subject'
      params do 
        requires :id, type: Integer, desc: 'id of subject'
      end
      get :teacher_courses do
        present :teachers, Teacher::SubjectList.new(subject_id: params[:id]).teacher_courses\
        , with: Satit::TeacherAPI::TeacherActionEntity
      end

      desc 'room once in subject'
      params do 
        requires :id, type: Integer, desc: 'id of subject'
      end
      get :room do
        present :room, Room::RoomList.new.by_ids(params[:id])\
        , with: Satit::RoomAPI::RoomListEntity
      end

      desc 'student all in room'
      params do 
        requires :id, type: Integer, desc: 'id of subject'
      end
      get :students do
        present :students, Room::RoomList.new.students(params[:id])\
        , with: Satit::StudentAPI::StudentListEntity
      end

    end
  end
end