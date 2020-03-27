class ContactChannel < ApplicationRecord
  NAMES = %w(email telephone website whatsapp)
    
  NAMES.each { |name| const_set name.to_s.upcase.to_sym, name }

  belongs_to :vendor
  
  validates :name, presence: true
  validates :name, inclusion: { in: NAMES, message: "%{value} is not a valid :name" }
end
