class Api::V1::CoursesController < ApplicationController
  before_action :set_course, only: %i[show destroy]
  before_action :authorized, only: %i[show create destroy]

  # GET /courses
  def index
    @courses = Course.all.includes(:description)

    render json: @ccourses.to_json(include: [:description]), status: 200
  end

  # GET /courses/1
  def show
    if @course
      render json: @course.to_json(include: [:description]), status: :ok
    else
      render json: { error: 'course not found' }, status: 400
    end
  end

  # POST /courses
  def create
    @course = Course.create(course_params.merge(user_id: @user.id))

    if @course.valid?
      @description = Description.create(description_params.merge(insurance_fee: 3, course_id: @course.id))
      if @description.valid?
        render json: @course.to_json(include: [:description]), status: :created
      else
        @course.destroy
        render json: { error: @description.errors.full_messages }, status: 409
      end
    else
      render json: { error: @course.errors.full_messages }, status: 409
    end
  end

  # DELETE /courses/1
  def destroy
    if @course
      @course.destroy
      if @course.destroyed?
        render json: { message: "course with id: #{params[:id]} successfully destroyed", id: params[:id] },
               status: :ok
      else
        render json: { error: "course with id: #{params[:id]} cannot be destroyed" }, status: 400
      end
    else
      render json: { error: 'course not found' }, status: 409
    end
  end

  private

  def set_course
    @course = Course.find_by_id(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def course_params
    params.require(:course).permit(:name, :brand, :imgUrl)
  end

  def description_params
    params.require(:description).permit(:price_daily, :price_monthly, :short_description)
  end
end
