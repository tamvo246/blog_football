class CoursesController < ApplicationController
  def show
    @course = Course.find_by(slug: params[:slug])

    @students = @course.students
  end
end
