require 'spec_helper'

describe Expense do
  describe "database" do
    it { should have_db_column(:name).of_type(:string).with_options(null: false) }
    it { should have_db_column(:weight).of_type(:integer).with_options(null: false, default: 0) }
  end

  describe "generators" do
  end

  describe "validators" do
    describe "uniqueness" do
      before do
        FactoryGirl.create(:expense)
      end

      it { should validate_uniqueness_of(:name) }
    end

    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:weight) }

    it { should allow_mass_assignment_of(:name) }
    it { should allow_mass_assignment_of(:weight) }

    it { should have_many(:month_expenses).dependent(:destroy) }
    it { should have_many(:months).through(:month_expenses) }
  end

  describe "public methods" do
  end

  describe "private methods" do
  end
end
