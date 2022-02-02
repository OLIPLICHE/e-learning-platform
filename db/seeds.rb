# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
codecaiine = User.create!(name: 'Codecaiine', email: 'codecaiine@gmail.com', password: '12345678')

course1 = Course.create!(title: 'course1', short_description: 'blababababa', description: 'Bbababa bababab bababababa babababa bababa', price: '100', language: 'french', date_start: '2022-02-1', date_end: '2022-02-9', level: 'Beginner', country: 'Nigeria', city:'Yamoussoukro', picture: 'http://www.pselaw.com/wp-content/uploads/2016/08/pokemon-150x150.jpg', user_id: codecaiine.id)

enrolment = Enrolment.create!(raiting: '5', review: 'Bbababababa', course_id: course1.id, user_id: codecaiine.id)
