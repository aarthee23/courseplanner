class Category < ApplicationRecord
  # Direct associations

  has_many   :course_categories,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
