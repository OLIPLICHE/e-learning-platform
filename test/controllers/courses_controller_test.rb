require 'test_helper'

class CoursesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @course = courses(:one)
  end

  test 'should get index' do
    get courses_url, as: :json
    assert_response :success
  end

  test 'should create course' do
    assert_difference('Course.count') do
      post courses_url, params: { course: { type: @course.type, image: @course.image, title: @course.title } },
                        as: :json
    end

    assert_response 201
  end

  test 'should show course' do
    get course_url(@course), as: :json
    assert_response :success
  end

  test 'should update course' do
    patch course_url(@course), params: { course: { type: @course.type, image: @course.image, title: @course.title } },
                               as: :json
    assert_response 200
  end

  test 'should destroy course' do
    assert_difference('Course.count', -1) do
      delete course_url(@course), as: :json
    end

    assert_response 204
  end
end
