require 'rails_helper'

RSpec.describe Course, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:course_concentrations) }

    it { should have_many(:course_categories) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
