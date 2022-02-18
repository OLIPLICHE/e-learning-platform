class CreateDescriptions < ActiveRecord::Migration[6.1]
  def change
    create_table :descriptions do |t|
      t.string :short_description
      t.text :description
      t.decimal :course_fee
      t.decimal :price_daily
      t.decimal :price_monthly
      t.references :course, null: false, foreign_key: true

      t.timestamps
    end
  end
end
