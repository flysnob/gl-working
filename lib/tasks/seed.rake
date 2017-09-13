namespace :db do                                                                                                                                                                                            
  namespace :seed do
    desc 'Populate the database with test data'
    task tests: :environment do
      load "#{Rails.root}/db/tests.rb"
    end 
  end 
end
