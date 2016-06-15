class StudentsController < ApplicationController
 
  attr_reader :room, :subject, :student
 
  def index 
    @subject = Subject.find(2)
    @students = @subject.students
    @room = Room.find(1)
    
  end

  def add_student_csv
    Student.add_student(params[:file])

    redirect_to index_path, notice: "Products imported student success."
  end


  def add_score_csv
    Student.add_score(params[:file])

    redirect_to index_path, notice: "Products imported score and grade to students success."
  end

end
