require 'spec_helper'

describe EmailAddress do
   let(:email_address) do
      EmailAddress.new(address: 'hi.geoom@gmail.com', person_id: '1')
   end
   it 'is valid' do
      expect(email_address).to be_valid
   end
   it 'is invalid without address' do
      email_address.address = nil
      expect(email_address).to_not be_valid
   end
   it 'must have a reference to a person' do
      email_address.person_id = nil
      expect(email_address).to_not be_valid
   end
end
