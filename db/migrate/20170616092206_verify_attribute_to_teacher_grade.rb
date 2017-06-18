class VerifyAttributeToTeacherGrade < ActiveRecord::Migration
  def change
    add_column :teacher_grades, :grade, :string, default:""
    add_column :teacher_grades, :score_result, :string, default:0.0
    remove_column :teacher_grades, :grader
    remove_column :teacher_grades, :score_reuslt
  end
end


#  id                 :integer          not null, primary key
#  student_subject_id :integer
#  teacher_id         :integer
#  score1             :integer
#  score2             :integer
#  grader             :string
#  score_reuslt       :float
#  created_at         :datetime         not null
#  updated_at         :datetime         not null