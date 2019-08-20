class MasterRole < ApplicationRecord

	# ---Associations
	has_many :user, dependent: :destroy, foreign_key: 'role_id'
end
