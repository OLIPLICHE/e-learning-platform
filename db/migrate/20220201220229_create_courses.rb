class CreateCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :courses do |t|
      t.string :title
      t.text :short_description
      t.text :description
      t.string :language
      t.string :level
      t.integer :price
      t.date :date_start
      t.date :date_end
      t.string :city
      t.string :country
      t.string :picture
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
