class Season < ApplicationRecord
	has_many :contestants
	belongs_to :bachelor, class_name: 'Person', foreign_key: 'bachelor_id'
end
