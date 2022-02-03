class Api::V1::CoursesController < ApplicationController
  before_action :set_course, only: :destroy

  def index
    @courses = current_user.courses.all
  end

  def create
    @course = current_user.courses.new(course_params)

    if @course.save
      render :create, status: :created
    else
      render json: @course.errors, status: :unprocessable_entity
    end
  end

  def destroy
        if @course.destroy
      render json: { message: "Course has been successfully deleted" }
    else
      render json: @course.errors, status: :unprocessable_entity
    end
  end

  private

  def set_course
    @course = Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:title, :short_description, :description, :language, :country, :city, :level,
                                   :price, :date_start, :date_end, :picture, :user_id)
  end
end
