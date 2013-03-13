ActiveAdmin.register Guideline do
	
  index do                            
    column :title   
    column :specialty                
    column :content       
    column :hospital
    column :country      
    column :user
    default_actions                   
  end


end
