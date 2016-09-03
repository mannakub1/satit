class Teacher::AdultAction

  attr_reader :params, :student, :father_id, :mother_id, :guardian_id, :first_name, :last_name, :id

  include Teacher::Private::AdultActionGuard
  include Teacher::Private::AdultAction

  def initialize(option = {})
    @student = option[:student]
  end

  def edit(params)
    @params = params
    @id = params[:id]

    can_edit, messege = can_edit?
    fail messege unless can_edit

    process_edit
  end

  def add(params)
    @params = params
    @first_name = params[:first_name]
    @last_name = params[:last_name]

    can_add, messege = can_add?
    fail messege unless can_add

    process_add
  end

  def add_father(father_id)
    @father_id = father_id

    can_add_father, messege = can_add_father?
    fail messege unless can_add_father

    return { status: 'false' } unless process_add_father

    { status: 'true' }
  end

  def add_mother(mother_id)
    @mother_id = mother_id

    can_add_mother, messege = can_add_mother?
    fail messege unless can_add_mother

    return { status: 'false' }  unless process_add_mother

    { status: 'true' }
  end

  def add_guardian(guardian_id)
    @guardian_id = guardian_id

    can_add_guardian, message = can_add_guardian?
    fail message unless can_add_guardian

    return { status: 'false' } unless process_add_guardian

    { status: 'true' }
  end

end