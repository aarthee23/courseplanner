class CreateCoursePlans < ActiveRecord::Migration[5.1]
  def change
    create_table :course_plans do |t|
      t.integer :user_id

      t.timestamps
    end
  end
end
