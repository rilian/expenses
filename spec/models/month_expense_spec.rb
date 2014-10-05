require 'spec_helper'

describe MonthExpense do
  describe "database" do
    it { is_expected.to have_db_column(:month_id).of_type(:integer).with_options(null: false) }
    it { is_expected.to have_db_column(:expense_id).of_type(:integer).with_options(null: false) }

    it { is_expected.to have_db_index([:month_id, :expense_id]).unique(true) }
  end

  describe "generators" do
  end

  describe "validators" do
    describe "uniqueness" do
      before do
        FactoryGirl.create(:month_expense)
      end

      it { is_expected.to validate_uniqueness_of(:month_id).scoped_to(:expense_id) }
    end

    it { is_expected.to validate_presence_of(:month_id) }
    it { is_expected.to validate_presence_of(:expense_id) }

    it { is_expected.to allow_mass_assignment_of(:month_id) }
    it { is_expected.to allow_mass_assignment_of(:expense_id) }
    it { is_expected.to allow_mass_assignment_of(:sum_real) }
    it { is_expected.to allow_mass_assignment_of(:desc) }

    it { is_expected.to belong_to(:month) }
    it { is_expected.to belong_to(:expense) }
  end

  describe "public methods" do
  end

  describe "private methods" do
  end
end
