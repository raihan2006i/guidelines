namespace :update do

  desc "Update country"
  task :country_fix => :environment do
    Guideline.where(:hospital => 'Great Ormond Street, UK').each do |t|
      t.update_attributes(hospital: 'Great Ormond Street Hospital')
      t.update_attributes(country: 'UK')
    end
    
  end
end
#rake update:specialty_fix
#heroku run rake update:specialty_fix