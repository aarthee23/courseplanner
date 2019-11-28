class UserCourseSelection < ApplicationRecord
  # Direct associations

  belongs_to :course_plan

  belongs_to :course

  # Indirect associations

  # Validations

end
