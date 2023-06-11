class CoursesController < ApplicationController
  def show
    @course = Course.find_by(slug: params[:slug])
    @courses = Course.all.order("created_at desc")
    @students = @course.students.page(params[:page]).per(10)
  end
end
