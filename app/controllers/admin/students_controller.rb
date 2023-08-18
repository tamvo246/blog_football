class Admin::StudentsController < Admin::BaseController
  load_and_authorize_resource

  def index
    @students = Student.order(created_at: :desc)

    if params[:course_id].present?
      @students = @students.where(course_id: params[:course_id])
    end

    @students = @students.page(params[:page]).per(10).order("created_at desc")
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      flash[:success] = "Thêm học viên thành công"
      redirect_to admin_students_path
    else
      flash[:error] = @student.errors.full_messages[0].to_s
      render :new
    end

  end

  def update
    authorize! :update, @student
    if @student.update(student_params)
      flash[:success] = "Sửa học viên thành công"
      redirect_to admin_students_path
    else
      flash[:error] = @student.errors.full_messages[0].to_s
      render :edit
    end
  end

  def edit
    @student = Student.find(params[:id])
    authorize! :update, @student
  end

  def destroy
    @student = Student.find(params[:id])
    authorize! :destroy, @student
    @student.destroy
    flash[:success] = "Xoá học viên thành công"
    redirect_to admin_students_path
  end

  private

  def student_params
    params.require(:student).permit(:name, :birth_day, :address, :course_id, :avatar, :gradurated_date, :achievements)
  end
end
