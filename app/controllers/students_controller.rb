class StudentsController < ApplicationController
 
  attr_reader :room, :subject, :student
  
  protect_from_forgery
  skip_before_filter :verify_authenticity_token

  def index 
  end

  def access_controller
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
    headers['Access-Control-Request-Method'] = '*'
    headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
  end

  def add_student_csv
    access_controller
    @room = params[:room_id]
    add_student(params[:csv])

    respond_to do |format|
      @status = { status: 'add student complete' }
      format.json { render json:  @status }
    end
  end

  def room_id
    session[:room_id] = params[:room_id]
  end

  def current_room
    @room ||= Room.find_by(id: session[:room_id])
  end

  def choice_room
    room_id

    respond_to do |format|
      @status = { status: 'choice room' }
      format.json { render json:  @status }
    end
  end 

  def room
    puts current_room.level

    respond_to do |format|
      @status = { status: current_room.level }
      format.json { render json:  @status }
    end
  end

  def add_score_csv
    Student.add_score(params[:file])

    redirect_to index_path, notice: 'Products imported score and grade to students success.'
  end

  require 'csv' 

  def add_student(file)
    CSV.foreach(file.path, headers: true) do |row|
      @student = Teacher::StudentAction.new().add_student(row['เลขประจำตัว'], row['ชื่อ'], row['นามสกุล'])
    end
  end

end
