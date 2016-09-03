module ApiController

  class StudentsController < ApplicationController
 
    require 'csv'

    def json_student_list
      student_list

      respond_to do |format|
        @room_id = current_room.as_json(only: [:id])
        @student = student_list.as_json(only: [:id, :code_number, :first_name, :last_name])
        format.json { render json: { room_id: current_room.id, student_list: @student } }
      end
    end

    def student_all
      student = Student.all.order(:code_number)

      respond_to do |format|
      
        @student = student.as_json(only: [:id, :code_number, :first_name, :last_name])
        format.json { render json: { student_list: @student } }
      end
    end

    def json_add_student
      add_student(params[:csv])

      respond_to do |format|
        @status = { status: 'add student complete' }
        format.json { render json:  @status } 
      end
    end

    def add_student(file)
      CSV.foreach(file.path, headers: true) do |row|
        student = Teacher::StudentAction.new.add_student(row['เลขประจำตัว'], row['ชื่อ'], row['นามสกุล'])
      end
    end

    def add_room  
      Student.where(room_state: false).each do |student|
        process_add_room(student)
      end

      respond_to do |format|
        @status = { status: 'add room complete' }
        format.json { render json:  @status } 
      end      
    end

    def process_add_room(student)
      Teacher::StudentAction.new(student: student).add_room(current_room)
    end

    def student_list
      current_room.students
    end

    def current_room
      @room ||= Room.find_by(id: params[:room_id])
    end


   

  end
  # def add_score_csv
  #   Student.add_score(params[:file])

  #   redirect_to index_path, notice: 'Products imported score and grade to students success.'
  # end 

end


