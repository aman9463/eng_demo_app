task :run_app => :environment do
	begin
		
		
		Rake::Task['db:migrate:reset'].invoke
		Rake::Task['db:seed'].invoke
	rescue Exception => e
puts e.message
	end
	
end