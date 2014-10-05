require 'spec_helper'

describe Month do
  describe "database" do
    it { is_expected.to have_db_column(:name).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:result).of_type(:text).with_options(null: false, default: '') }
  end

  describe "generators" do
  end

  describe "validators" do
    it { is_expected.to validate_presence_of(:name) }

    it { is_expected.to allow_mass_assignment_of(:name) }
    it { is_expected.to allow_mass_assignment_of(:result) }
    it { is_expected.to allow_mass_assignment_of(:month_expenses_attributes) }

    it { is_expected.to have_many(:month_expenses).dependent(:destroy) }
    it { is_expected.to have_many(:expenses).through(:month_expenses) }
  end

  describe "public methods" do
  end

  describe "private methods" do
    describe 'generate_month_expenses' do
      before do
        FactoryGirl.create_list(:expense, 2)
      end

      it 'generates all month_expenses for self after create' do
        month = FactoryGirl.create(:month)
        expect(month.expenses.map(&:id)).to match Expense.all.map(&:id)
      end
    end
  end
end
