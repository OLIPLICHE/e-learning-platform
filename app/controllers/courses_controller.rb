class CoursesController < ApplicationController
  def index
    courses = Courses.all
    render json: courses
  end
end
