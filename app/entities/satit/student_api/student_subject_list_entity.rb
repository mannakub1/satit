module Satit::StudentAPI

  class StudentSubjectListEntity < Grape::Entity
    expose :id
    expose :subject\
    , with: Satit::SubjectAPI::SubjectListEntity
    expose :score1
    expose :score2
    expose :grade
  end
end