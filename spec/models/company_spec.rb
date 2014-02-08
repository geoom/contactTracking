require 'spec_helper'

describe Company do
  let(:company) { Company.new(name: 'new company') }
  it 'is valid' do
  	expect(company).to be_valid
  end
  it 'is invalid without name' do
  	company.name = nil
  	expect(company).to_not be_valid
  end
end
