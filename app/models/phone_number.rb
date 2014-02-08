class PhoneNumber < ActiveRecord::Base
	belongs_to :contact, polymorphic: true
	belongs_to :company
	
	validates :number, :contact_id, presence: true
end
