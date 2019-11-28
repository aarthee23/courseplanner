require 'rails_helper'

RSpec.describe CourseConcentration, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:course) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
