require 'spec_helper'
require 'capybara/rails'
require 'capybara/rspec'

describe 'the company view', type: :feature do
	let(:company) { Company.create(name: 'Chelita') }

	describe 'phone numbers' do

		before(:each) do
			company.phone_numbers.create(number: '12345678')
			company.phone_numbers.create(number: '098765432')
			visit company_path(company)
		end

		it 'show the phone numbers' do
			company.phone_numbers.each do |phone|
				expect(page).to have_content(phone.number)
			end
		end

		it 'has a link to add new phone number' do
			expect(page).to have_link('Add phone number', href: new_phone_number_path(contact_id: company.id, contact_type: 'Company'))
		end

		it 'adds a new phone number' do
			page.click_link('Add phone number')
			page.fill_in('Number', with: '12345678')
			page.click_button('Create Phone number')

			expect(current_path).to eq(company_path(company))
			expect(page).to have_content('12345678')
		end

		it 'has links to edit phone numbers' do
			company.phone_numbers.each do |phone|
				expect(page).to have_link('edit', href: edit_phone_number_path(phone))
			end
		end

		it 'edits a phone number' do
			phone = company.phone_numbers.first
			old_number = phone.number

			first(:link, 'edit').click
			page.fill_in('Number', with: '555-9191')
			page.click_button('Update Phone number')
			expect(current_path).to eq(company_path(company))
			expect(page).to have_content('555-9191')
			expect(page).to_not have_content(old_number)
		end

		it 'has link to delete a phone number' do
			company.phone_numbers.each do |phone|
				expect(page).to have_link('remove', href: phone_number_path(phone))
			end
		end

		it 'removes a phone number' do
			phone = company.phone_numbers.first
			old_number = phone.number

			first(:link, 'remove').click
			expect(current_path).to eq(company_path(company))
			expect(page).to_not have_link('remove', href: phone_number_path(old_number))
		end
	end

	describe 'email addresses' do

		before(:each) do
			company.email_addresses.create(address: 'email3443@email.com')
			company.email_addresses.create(address: 'email4544@email.com')
			visit company_path(company)
		end

		it 'show email addresses' do
			company.email_addresses.each do |email|
				expect(page).to have_selector('li', text: email.address)
			end
		end

		it 'has a link to add email address' do
			expect(page).to have_link('Add email address', href: new_email_address_path(contact_id: company.id, contact_type: 'Company'))
		end

		it 'adds a new email address' do
			page.click_link('Add email address')
			page.fill_in('Address', with: 'mail@mail.com')
			page.click_button('Create Email address')

			expect(current_path).to eq(company_path(company))
			expect(page).to have_content('mail@mail.com')
		end

	end

end