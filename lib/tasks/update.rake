namespace :update do

  desc "Update Starship hospital"
  task :specialty_fix => :environment do
    Guideline.where(:specialty => 'Trauma').each do |t|
      t.update_attributes(specialty: 'Emergency Medicine')
    end
  end
end

#heroku run rake update:specialty_fix