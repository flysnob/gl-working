namespace :db do                                                                                                                                                                                            
  namespace :seed do
    desc 'Populate the database with test data'
    task data: :environment do
      load "#{Rails.root}/db/data.rb"
    end 
  end 
end
