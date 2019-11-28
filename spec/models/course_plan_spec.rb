require 'rails_helper'

RSpec.describe CoursePlan, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:user_course_selections) }

    it { should belong_to(:user) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
