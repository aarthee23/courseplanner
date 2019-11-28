class CoursePlan < ApplicationRecord
  # Direct associations

  has_many   :user_course_selections,
             :dependent => :destroy

  belongs_to :user

  # Indirect associations

  # Validations

end
