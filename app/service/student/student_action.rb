class Student::StudentAction

  attr_reader :username, :password_digest, :params, :student, :room

  include Student::Private::StudentAction
  include Student::Private::StudentActionGuard

  def initialize(option = {})
    @params ||= option[:params]
    @student ||= option[:student]
  end

  def add 
    can_add, message = can_add?
    fail message unless can_add

    process_add
  end

  def add_picuture
    can_add_picture, message = can_add_picture?
    fail message unless can_add_picture

    process_add_picture
  end

  def edit
    can_edit, message = can_edit?
    fail message unless can_edit

    process_edit
  end

  def delete
    can_delete, message = can_delete?
    fail message unless can_delete

    process_delete
  end

  def authenication
    @username = @params[:username].downcase
    @password_digest = @params[:password]

    can_authenication, message = can_authenication?
    fail message unless can_authenication

    process_authenication
  end

  
end