module Satit::StudentAPI

  class StudentSubjectListEntity < Grape::Entity
    expose :id
    expose :subject\
    , with: Satit::SubjectAPI::SubjectListEntity
    expose :score1
    expose :score2
    expose :score_result
    expose :grade
    expose :status
    expose :student_room \
    , with: Satit::StudentAPI::StudentRoomEntity
  end
end