class CreateUserCourseSelections < ActiveRecord::Migration[5.1]
  def change
    create_table :user_course_selections do |t|
      t.integer :course_plan_id
      t.integer :course_id
      t.string :professor
      t.string :quarter
      t.string :day
      t.string :hours_of_preparation
      t.string :rating
      t.string :bid_points
      t.string :pre_req

      t.timestamps
    end
  end
end
