class CreateCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :courses do |t|
      t.string :title
      t.integer :number
      t.string :unit

      t.timestamps
    end
  end
end
