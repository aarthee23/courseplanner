class CreateCourseConcentrations < ActiveRecord::Migration[5.1]
  def change
    create_table :course_concentrations do |t|
      t.integer :course_id
      t.integer :concentration_id

      t.timestamps
    end
  end
end
