class Course < ApplicationRecord
  # Direct associations

  has_many   :course_concentrations,
             :dependent => :destroy

  has_many   :course_categories,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
