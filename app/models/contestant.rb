class Contestant < ApplicationRecord
	belongs_to :person
	belongs_to :season
	has_many :notes

	default_scope { order(eliminated_ep: :desc) }

	def eliminated_string
		if self.eliminated_ep
			if self.elimination_reason
				"#{self.elimination_reason} in episode #{self.eliminated_ep}"
			else
				"Eliminated episode #{self.eliminated_ep}"
			end
		else
			"Still here"
		end
	end
end
