require 'rails_helper'

RSpec.describe Enrolment, type: :model do
  let(:user) { User.create(name: 'Yannick', email: 'example@mail.com', password: 'mypassword') }
  let(:course) do
    Course.create(user_id: user.id, title: 'Ruby on Rails module', picture: 'logo.png', city: 'Yakro', country: 'France', short_description: 'lala lallal', description: 'Zoz zoz ozoz', language: 'french', level: 'Beginner',
                  price: '100', date_start: '2015-01-9', date_end: '2015-01-7')
  end
  let(:enrolment) do
    Enrolment.create(rating: '5', review: 'rrr bbbb', course_id: course.id, user_id: user.id)
  end

  describe 'Validations' do
    context 'when valid' do
      it { expect(enrolment).to be_valid }
    end

    it 'should allow valid rating' do
      enrolment.rating = nil
      expect(enrolment).to_not be_valid
    end

    it 'should allow valid rating' do
      enrolment.rating = 8
      expect(enrolment).to be_valid
    end

    it 'should allow valid rating' do
      enrolment.rating = 0
      expect(enrolment).to be_valid
    end

    it 'should allow valid review' do
      enrolment.review = nil
      expect(enrolment).to_not be_valid
    end

    it 'should allow valid review' do
      enrolment.review = 'arrrrr tttt'
      expect(enrolment).to be_valid
    end
  end
end
