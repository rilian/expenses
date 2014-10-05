require 'spec_helper'

FactoryGirl.factories.map(&:name).each do |factory_name|
  describe "The #{factory_name} factory" do
    it 'should be valid' do
      object = FactoryGirl.build(factory_name.to_sym)
      object.save
      expect(object.errors.full_messages).to eq []
      expect(object).to be_valid
    end
  end
end
