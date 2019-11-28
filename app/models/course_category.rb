class CourseCategory < ApplicationRecord
  # Direct associations

  belongs_to :category

  belongs_to :course

  # Indirect associations

  # Validations

end
