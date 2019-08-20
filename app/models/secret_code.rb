class SecretCode < ApplicationRecord
	# ---Associations
	has_one :user, dependent: :destroy

end
