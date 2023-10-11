class Contestant < ApplicationRecord
	belongs_to :person
	belongs_to :season
	has_many :notes
end
