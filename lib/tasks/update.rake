namespace :update do

  desc "Update Starship hospital"
  task :specialty_fix => :environment do
    Guideline.where(:specialty => 'Haematology/Oncology').each do |t|
      t.update_attributes(specialty: 'Paediatrics')
    end
    Guideline.where(:specialty => 'Haematology').each do |t|
      t.update_attributes(specialty: 'Haematology/Oncology')
    end
    Guideline.where(:specialty => 'Obstetrics').each do |t|
      t.update_attributes(specialty: 'Obstetrics/Gynaecology')
    end
  end
end
#rake update:specialty_fix
#heroku run rake update:specialty_fix