desc "This task is called by the Heroku scheduler add-on"
task :update_availability_all => :environment do
  Gpu.update_availability_all
end