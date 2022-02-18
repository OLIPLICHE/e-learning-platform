class CreateCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :courses do |t|
      t.string :title
      t.string :course_type
      t.string :image
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
