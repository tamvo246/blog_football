class Admin::CoachesController < Admin::BaseController
  load_and_authorize_resource

  def index
    @coachs = Coach.order(created_at: :desc)

    if params[:course_id].present?
      @coachs = @coachs.joins(:courses).where("courses.id = ?", params[:course_id])
    end

    @coachs = @coachs.page(params[:page]).per(10).order("created_at desc")
  end

  def new
    @coach = Coach.new
  end

  def create

    @coach = Coach.new(coach_params)
    if params[:coach][:course_ids].present?
      course_ids = generate_course_ids(params[:coach][:course_ids])
      @coach.course_ids = course_ids
    end
    if @coach.save
      flash[:success] = "Thêm HLV thành công"
      redirect_to admin_coaches_path
    else
      flash[:error] = @coach.errors.full_messages[0].to_s
      render :new
    end

  end

  def update
    authorize! :update, @coach
    if params[:coach][:course_ids].present?
      course_ids = generate_course_ids(params[:coach][:course_ids])
      @coach.course_ids = course_ids
    end
    if @coach.update(coach_params)
      flash[:success] = "Sửa HLV thành công"
      redirect_to admin_coaches_path
    else
      flash[:error] = @coach.errors.full_messages[0].to_s
      render :edit
    end
  end

  def edit
    @coach = Coach.find(params[:id])
    authorize! :update, @coach
  end

  def destroy
    @coach = Coach.find(params[:id])
    authorize! :destroy, @coach
    @coach.destroy
    flash[:success] = "Xoá HLV thành công"
    redirect_to admin_coaches_path
  end

  private
  def generate_course_ids course_ids
    list_ids = course_ids.select { |value| value != 'checked true' && value != 'checked false' }
    return list_ids if list_ids.count <= 0
    return list_ids.map{|item|  Integer(item)}
  end

  def coach_params
    params.require(:coach).permit(:name, :birth_day, :address, :avatar, :phone, :email, :achievements)
  end
end
