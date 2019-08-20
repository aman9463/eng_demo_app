class CreateMasterRoles < ActiveRecord::Migration[5.2]
	def change
		create_table :master_roles do |t|
			t.string :name
			t.string :default_name
			t.index :name, unique: true
			t.index :default_name, unique: true
			t.timestamps
		end
	end
end
