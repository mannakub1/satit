class Teacher::StudentAction
  
  
  attr_reader :student, :student_id, :room, :code_number, :first_name, :last_name, :params, :subject, :student_room

  require 'rmagick'
  require 'base64'
  include Teacher::Private::StudentAction
  include Teacher::Private::StudentActionGuard

  def initialize(option = {})
    @student_id ||= option[:student_id]
    @student ||= option[:student]
    @subject ||= option[:subject]
    @room ||= option[:room]
    @student_room ||= option[:student_room]
  end

  def add_student(params)
    @first_name = params[:first_name]
    @last_name = params[:last_name]
    @code_number = params[:code_number]
    @params = params

    can_add, message = can_add?
    fail message unless can_add

    process_add_student
  end

  def add_room(room)
    @room = room
    
    can_add_room, message = can_add_room?
    fail message unless can_add_room

    process_add_room
    @student.student_rooms.last.update_attributes(status: false)
    # student_room.update_attributes(room_state: true)
  end


  def update_image(params,headers)
    puts headers['Id']
    id = headers['Id']
    puts params[:image]
    base = Base64.decode64(params[:image])
    puts 'after encoder'
    puts 'before image'
    img = Magick::Image.from_blob(params[:iamge].read)
    puts 'after read imgae'
    
    # img = img.resize(1920, 1080)
    thumb = img
    year = Student.find(id).student_rooms.first.room.year
    puts year
    `mkdir public/picture/#{year}`
    img.write("public/picture/#{year}/#{id}_image.png")
    puts "after write image"
    thumb.write("public/picture/#{year}/#{id}_thumb.png")

    image = "public/picture/#{year}/#{id}_image.png"
    th = "public/picture/#{year}/#{id}_thumb.png"

    current_student.update_attributes(image: image, thumb: th)
  end

  def edit(params)
    puts params[:image].size
    puts 'after puts image'
    if params[:image] != nil
      puts "5555"
      base = Base64.decode64(params[:image])
      img = Magick::Image.read(base).first
      puts "6666"
      img = img.resize(1920, 1080)
      thumb = img.resize(48, 48)
      year = Student.find(params[:id]).student_rooms.first.room.year
      puts year
      `mkdir public/picture/#{year}`
      img.write("public/picture/#{year}/#{params[:id]}_image.png")
      thumb.write("public/picture/#{year}/#{params[:id]}_thumb.png")
      
      # params[:image] = img
      # params[:thumb] = thumb

      params[:image] = img.display
      puts "7777"
      params[:thumb] = thumb.display
    end
    # params[:thumb] = params[:image]
    params.except!(:id)
    current_student.update_attributes(params)


    current_student
  end

  def add_subject

    can_add_subject, message = can_add_subject?
    fail message unless can_add_subject

    process_add_subject
  end

  def current_student
    Student.find_by(id: @student_id)
  end

  def student_room_delete

    can_student_room_delete, message = can_student_room_delete?
    fail message = unless can_student_room_delete

    process_student_room_delete
  end  

end
end