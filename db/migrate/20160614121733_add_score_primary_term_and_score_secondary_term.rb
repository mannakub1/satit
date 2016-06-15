class AddScorePrimaryTermAndScoreSecondaryTerm < ActiveRecord::Migration
  def change
    add_column :student_subjects, :score_primary_term, :float
    add_column :student_subjects, :score_secondary_term, :float
  end
end
