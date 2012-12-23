require 'spec_helper'

describe Month do
  describe "database" do
    it { should have_db_column(:name).of_type(:string).with_options(null: false) }
    it { should have_db_column(:result).of_type(:text).with_options(null: false, default: '') }
  end

  describe "generators" do
  end

  describe "validators" do
    it { should validate_presence_of(:name) }

    it { should allow_mass_assignment_of(:name) }
    it { should allow_mass_assignment_of(:result) }
    it { should allow_mass_assignment_of(:month_expenses_attributes) }

    it { should have_many(:month_expenses).dependent(:destroy) }
  end

  describe "public methods" do
  end

  describe "private methods" do
  end
end
