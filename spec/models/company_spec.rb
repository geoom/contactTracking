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
  it 'has an array of phone numbers' do
		expect(company.phone_numbers).to eq([])
	end
	it "responds with its phone numbers after they're created" do
	  phone_number = company.phone_numbers.build(number: "333-4444")
	  expect(phone_number.number).to eq('333-4444')
	end
  it 'has an array of emails' do
    expect(company.email_addresses).to eq([])
  end
  it "responds with its emails after they're created" do
    new_email = company.email_addresses.build(address: "email2@email.com")
    expect(new_email.address).to eq('email2@email.com')
  end
end
