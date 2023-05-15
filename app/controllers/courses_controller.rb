class CoursesController < ApplicationController
  def show
    @course = Course.find_by(slug: params[:slug])
    @courses = Course.all
    @students = @course.students.page(params[:page]).per(2)
  end
end
