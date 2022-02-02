json.enrolment do
  json.id @enrolment.id
  json.rating @enrolment.rating
  json.review @enrolment.review
  json.course_id @enrolment.course_id
  json.user_id @enrolment.user_id
  json.created_at @enrolment.created_at
end
