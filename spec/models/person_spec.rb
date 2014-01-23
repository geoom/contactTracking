require 'spec_helper'

describe Person do
	it 'is valid' do
		person = Person.new(first_name: 'George', last_name: 'Mejia')
		expect(person).to be_valid
	end
	it 'is valid without a first name' do
		person = Person.new(first_name: nil)
		expect(person).not_to be_valid
	end
	it 'is invalid without a last name' do
		person = Person.new(first_name: 'Bob', last_name: nil)
		expect(person).not_to be_valid
	end
end
