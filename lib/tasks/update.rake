namespace :update do

  desc "Update Starship hospital"
  task :specialty_fix => :environment do
    Guideline.where(:specialty => 'Paediatrics').each do |t|
      t.update_attributes(specialty: 'Haematology/Oncology')
    end
  end
end
#rake update:specialty_fix
#heroku run rake update:specialty_fix