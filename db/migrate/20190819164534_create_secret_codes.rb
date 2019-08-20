class CreateSecretCodes < ActiveRecord::Migration[5.2]
	def change
		create_table :secret_codes do |t|
			t.string :code, null: false
			t.boolean :is_active, default: true
			t.timestamps
		end
	end
end
