require 'rails_helper'

RSpec.describe Concentration, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:course_concentrations) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
