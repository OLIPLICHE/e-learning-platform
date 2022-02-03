class Api::V1::EnrolmentsController < ApplicationController
  before_action :set_enrolment, only: :destroy

  def index
    @enrolments = current_user.enrolments
  end

  def show; end

  def create
    @enrolment = current_user.enrolments.new(enrolment_params)

    if @enrolment.save
      render :create, status: :created
    else
      render json: @enrolment.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @enrolment.destroy
  end

  private

  def set_enrolment
    @enrolment = Enrolment.find(params[:id])
  end

  def enrolment_params
    params.require(:enrolment).permit(:rating, :review, :course_id)
  end
end
