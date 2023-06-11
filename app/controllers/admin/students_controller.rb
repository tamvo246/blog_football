class Admin::StudentsController < Admin::BaseController
  load_and_authorize_resource

  def index
    @students = Student.order(created_at: :desc).page(params[:page]).per(10).order("created_at desc")
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    @student.save
    redirect_to admin_students_path
  end

  def update
    authorize! :update, @student
    if @student.update(student_params)
      redirect_to admin_students_path
    else
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
    redirect_to admin_students_path
  end

  private

  def student_params
    params.require(:student).permit(:name, :birth_day, :address, :course_id, :avatar)
  end
end
