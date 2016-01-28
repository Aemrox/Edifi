# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

desc "destroy all users, subjects and skills in db"
task :clear_core_data! => :environment do
  puts "starting to dump yo data"
  User.destroy_all
  Subject.destroy_all
  Skill.destroy_all
  puts "dumped yo data"
end


Rails.application.load_tasks
