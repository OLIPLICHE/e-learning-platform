# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create(username: 'juanito', email: 'foo@foo.com', password: 'admin123')
User.create(username: 'Laylita', email: 'foo0@foo.com', password: 'admin123')
User.create(username: 'Nelsinito', email: 'foo1@foo.com', password: 'admin123')
User.create(username: 'Hamzita', email: 'foo2@foo.com', password: 'admin123')

Course.create(title: 'Me meme', course_type: 'zozo', image: 'https://i.ibb.co/TPSp6yR/9.png', user_id: 4)
Course.create(title: 'b b b b b', course_type: 'philo', image: 'https://i.ibb.co/44HhvH9/5.png', user_id: 2)
Course.create(title: 'Muht htht', course_type: 'Ford', image: 'https://i.ibb.co/hgqn1y6/4.png', user_id: 1)
Course.create(title: 'IS grgrgr ', course_type: 'Lexus', image: 'https://i.ibb.co/Fqd9Z73/3.png', user_id: 3)
Course.create(title: 'Chkdkdkd ', course_type: 'it', image: 'https://i.ibb.co/0BM7Pnd/2.png', user_id: 3)
Course.create(title: 'Eagaga', course_type: 'Ford', image: 'https://i.ibb.co/hdWCftm/1.png', user_id: 2)

Description.create(course_fee: 3, price_daily: 5, price_monthly: 150, course_id: 1, short_description: 'eee bbb nnn', description: 'tt tt ttt')
Description.create(course_fee: 3, price_daily: 0.5, price_monthly: 15, course_id: 4, short_description: 'eee bbb nnn', description: 'tt tt t')
Description.create(course_fee: 3, price_daily: 5, price_monthly: 150, course_id: 2, short_description: 'eee bbb nnn', description: 'eeee rrr rrr rrr rrr r')
Description.create(course_fee: 3, price_daily: 5, price_monthly: 150, course_id: 3, short_description: 'eee bbb nnn', description: 'dc bbrbrb  brbb')
Description.create(course_fee: 3, price_daily: 20, price_monthly: 600, course_id: 5, short_description: 'eee bbb nnn', description: 'dc bbrbrb brbb')
Description.create(course_fee: 3, price_daily: 10, price_monthly: 300, course_id: 6, short_description: 'eee bbb nnn', description: 'rr bbbb bbbb')

City.create(name: 'Guatemala')
City.create(name: 'Tashkent')
City.create(name: 'Morrocco')
City.create(name: 'Palo alto')
City.create(name: 'Rome')
City.create(name: 'Hamburg')

Reservation.create(start_date: '2020-10-08', end_date: '2020-10-10', user_id: 1, course_id: 1, city_id: 1)
Reservation.create(start_date: '2020-10-08', end_date: '2020-10-10', user_id: 2, course_id: 2, city_id: 2)
Reservation.create(start_date: '2020-10-08', end_date: '2020-10-10', user_id: 3, course_id: 3, city_id: 3)
Reservation.create(start_date: '2020-10-08', end_date: '2020-10-10', user_id: 4, course_id: 4, city_id: 4)
Reservation.create(start_date: '2020-10-08', end_date: '2020-10-10', user_id: 2, course_id: 5, city_id: 5)
Reservation.create(start_date: '2020-10-08', end_date: '2020-10-10', user_id: 3, course_id: 6, city_id: 6)

