class Admin::CoursesController < Admin::BaseController
  load_and_authorize_resource

  def index
    @courses = Course.order(created_at: :desc).page(params[:page]).per(10).order("created_at desc")
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      flash[:success] = "Thêm khoá học thành công"
      redirect_to admin_courses_path
    else
      flash[:error] = @course.errors.full_messages[0].to_s
      render :new
    end

  end

  def update
    authorize! :update, @course
    if @course.update(course_params)
      flash[:success] = "Sửa khoá học thành công"
      redirect_to admin_courses_path
    else
      flash[:error] = @course.errors.full_messages[0].to_s
      render :edit
    end
  end

  def edit
    @course = Course.find(params[:id])
    authorize! :update, @course
  end

  def destroy
    @course = Course.find(params[:id])
    authorize! :destroy, @course
    @course.destroy
    flash[:success] = "Xoá khoá học thành công"
    redirect_to admin_courses_path
  end

  private

  def course_params
    params.require(:course).permit(:name, :slug, :opened_date, :closed_date, :course_age, :target, :course_details, coach_ids: [])
  end
end
