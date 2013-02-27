namespace :update do

  desc "Update Starship hospital"
  task :hospital_fix => :environment do
    Guideline.where(:hospital => 'Starship Hospital, NZ').each do |t|
      t.update_attributes(hospital: "Starship Children's Hospital, NZ")
    end
  end
end