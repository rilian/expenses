require 'spec_helper'

describe Expense do
  describe "database" do
    it { is_expected.to have_db_column(:name).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:weight).of_type(:integer).with_options(null: false, default: 0) }
    it { is_expected.to have_db_column(:is_active).of_type(:boolean).with_options(null: false, default: true) }
    it { is_expected.to have_db_index(:is_active) }
  end

  describe "generators" do
  end

  describe "validators" do
    describe "uniqueness" do
      before do
        FactoryGirl.create(:expense)
      end

      it { is_expected.to validate_uniqueness_of(:name) }
    end

    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:weight) }

    it { is_expected.to allow_mass_assignment_of(:name) }
    it { is_expected.to allow_mass_assignment_of(:weight) }

    it { is_expected.to have_many(:month_expenses).dependent(:destroy) }
    it { is_expected.to have_many(:months).through(:month_expenses) }
  end

  describe "public methods" do
  end

  describe "private methods" do
  end
end
