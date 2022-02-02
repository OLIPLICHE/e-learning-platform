json.course do
  json.id @course.id
  json.title @course.title
  json.short_description @course.short_description
  json.description @course.description
  json.language @course.language
  json.level @course.level
  json.price @course.price
  json.country @course.country
  json.city @course.city
  json.date_start @course.date_start
  json.date_end @course.date_end
  json.picture @course.picture
  json.created_at @course.created_at
end
