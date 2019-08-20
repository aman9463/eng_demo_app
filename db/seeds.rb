begin

	puts "Master Role initializing..."
	MasterRole.delete_all
	MasterRole.create!([{id: 1, name: "User", default_name: "user"},
		{id: 2, name: 'Admin', default_name: 'admin'}
	])

	puts "Create admins..."

	User.create([
		{id: 1, f_name: 'Admin', l_name: 'Aman', email: 'aman9463+admin@gmail.com', password: '12345678', role_id: 2
	}])


rescue Exception => e
	puts e.message
	
end