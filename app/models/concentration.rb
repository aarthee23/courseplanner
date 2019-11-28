class Concentration < ApplicationRecord
  # Direct associations

  has_many   :course_concentrations,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
