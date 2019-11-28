class CourseConcentration < ApplicationRecord
  # Direct associations

  belongs_to :concentration

  belongs_to :course

  # Indirect associations

  # Validations

end
